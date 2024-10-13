% earlyoom(1) | General Commands Manual

# NAME

earlyoom - Early OOM Daemon

# SYNOPSIS

**earlyoom** [**OPTION**]...

# DESCRIPTION

The oom-killer generally has a bad reputation among Linux users. One may have
to sit in front of an unresponsive system, listening to the grinding disk for
minutes, and press the reset button to quickly get back to what one was doing
after running out of patience.

**earlyoom** checks the amount of available memory and free swap up to 10 times a
second (less often if there is a lot of free memory).
If **both** memory **and** swap (if any) are below 10%, it will kill the
largest process (highest `oom_score`).

The percentage values are configurable via command line arguments.

If there is a failure when trying to kill a process, **earlyoom** sleeps for
1 second to limit log spam due to recurring errors.

# OPTIONS

#### -m PERCENT[,KILL_PERCENT]
set available memory minimum to PERCENT of `user mem total` (default 10 %).

`user mem total`, introduced in earlyoom v1.8, is the memory accessible by userspace
(`MemAvailable`+`AnonPages` as reported in `/proc/meminfo`).
When a tmpfs ramdisk fills up, `user mem total` shrinks accordingly.

By using a percentage of `user mem total` as opposed to total memory,
the set memory minimum can always be achieved by killing processes, even
when tmpfs fills a large portion of memory.

earlyoom sends SIGTERM once **both** available memory **and** free swap are
below their respective PERCENT settings.

It sends SIGKILL once **both** are below their respective
KILL_PERCENT setting (default PERCENT/2).

Use the same value for PERCENT and KILL_PERCENT if you always want to use SIGKILL.

Examples:

    earlyoom              # sets PERCENT=10, KILL_PERCENT=5
    earlyoom -m 30        # sets PERCENT=30, KILL_PERCENT=15
    earlyoom -m 20,18     # sets PERCENT=20, KILL_PERCENT=18

#### -s PERCENT[,KILL_PERCENT]
set free swap minimum to PERCENT of total (default 10 %).
Send SIGKILL if at or below KILL_PERCENT (default PERCENT/2), otherwise SIGTERM.

You can use `-s 100` to have earlyoom effectively ignore swap usage:
Processes are killed once available memory drops below the configured
minimum, no matter how much swap is free.

Use the same value for PERCENT and KILL_PERCENT if you always want to use SIGKILL.

#### -M SIZE[,KILL_SIZE]
As an alternative to specifying a percentage of total memory, `-M` sets
the available memory minimum to SIZE KiB. The value is internally converted
to the percentage of `mem total` as reported on startup. `user mem total` is
NOT used for the startup calculation because that would make the outcome dependent
on how filled tmpfs is at that moment.

If you pass both `-M` and `-m`, the lower value is used.
Example: Reserve 10% of RAM but at most 1 GiB:

    earlyoom -m 10 -M 1048576

earlyoom sends SIGKILL if at or below KILL_SIZE (default SIZE/2), otherwise SIGTERM.

#### -S SIZE[,KILL_SIZE]
As an alternative to specifying a percentage of total swap, `-S` sets
the free swap minimum to SIZE KiB. The value is internally converted
to a percentage. If you pass both `-S` and `-s`, the lower value is used.

Send SIGKILL if at or below KILL_SIZE (default SIZE/2), otherwise SIGTERM.

#### -k
removed in earlyoom v1.2, ignored for compatibility

#### -i
removed in earlyoom v1.7, ignored for compatibility

#### -d, --debug
enable debugging messages

#### -v
print version information and exit

#### -r INTERVAL
Time between printing periodic memory reports, in seconds (default 1.0).
A memory report looks like this:

    mem avail: 21790 of 23909 MiB (91.14%), swap free:    0 of    0 MiB ( 0.00%)

Set to 3600 to print a report every hour, to 86400 to print once a day
etc. Set to 0 to disable printing periodic memory reports.
Free memory monitoring and low-memory killing runs independently of
this option at an adaptive poll rate that only depends on free memory.
Due to the adaptive poll rate, when there is a lot of free memory,
the actual interval may be up to 1 second longer than the setting.

#### -p
Increase earlyoom's priority: set niceness of earlyoom to -20 and oom_score_adj to -100.

When earlyoom is run through its default systemd service, the `-p` switch doesn't work. To achieve the same effect, enter the following three lines into `sudo systemctl edit earlyoom`:

    [Service]
    OOMScoreAdjust=-100
    Nice=-20

#### -n
Enable notifications via d-bus.

To actually see the notifications in your GUI session, you need to have
[systembus-notify](https://github.com/rfjakob/systembus-notify)
running as your user.

#### -N /PATH/TO/SCRIPT
Run the given script for each process killed. Must be an absolute path.

Within the script, information about the killed process can be obtained via the
following environment variables:

    EARLYOOM_PID     Process PID
    EARLYOOM_NAME    Process name truncated to 16 bytes (as reported in /proc/PID/comm)
    EARLYOOM_CMDLINE Process cmdline truncated to 256 bytes (as reported in /proc/PID/cmdline)
    EARLYOOM_UID     UID of the user running the process

WARNING: `EARLYOOM_NAME` can contain spaces, newlines, special characters
and is controlled by the user, or it can be empty! Make sure that your
notification script can handle that!

#### -g
Kill all processes that have same process group id (PGID) as the process
with excessive memory usage.

For example, with this flag turned on, the whole application will be killed when
one of its subprocess consumes too much memory (as long as they all have the
same PGID, of course).

Enable this flag when completely cleaning up the "entire application" is more desirable,
and you are sure that the application puts all its processes in the same PGID.

Note that some desktop environments (GNOME, for example) put all desktop
application in the same process group as `gnome-shell`. earlyoom might kill
all such processes including `gnome-shell` when this flag is turned on.

Be sure to check how your environment behaves beforehand. Use

	pstree -gT

to show all processes with the PGID in brackets.

#### \-\-prefer REGEX
Prefer killing processes whose `comm` name matches REGEX (adds 300 to oom_score).

The `comm` name is the string in `/proc/pid/comm`. It is the first 15 bytes of the
process name. Longer names are truncated to 15 bytes.

The `comm` name is also what `top`, `pstree`, `ps -e` show. Use any of these tools
to find the proper `comm` name.

Example: You want to match `gnome-control-center`, which is longer than 15 bytes:

    earlyoom --prefer '^gnome-control-c$'

#### \-\-avoid REGEX
avoid killing processes whose `comm` name matches REGEX (subtracts 300 from oom_score).

#### \-\-ignore REGEX
ignore processes whose `comm` name matches REGEX.

Unlike the \-\-avoid option, this option disables any potential killing of the matched processes
that might have occurred due to the processes attaining a high oom_score.

Use this option with caution as other processes might be sacrificed in place of the ignored
processes when earlyoom determines to kill processes.

### \-\-sort-by-rss
find process with the largest rss (default oom_score)

#### \-\-dryrun
dry run (do not kill any processes)

#### \-\-syslog
use syslog instead of std streams.

Usually this is not needed as systemd handles logging
of all output.

The \-\-syslog option may be useful for minimal embedded
systems that don't run systemd.
See https://github.com/rfjakob/earlyoom/pull/292 for some
background info.

#### -h, \-\-help
this help text

# EXIT STATUS

0: Successful program execution.

1: Other error - inspect message for details

2: Switch conflict.

4: Could not cd to /proc

5: Could not open proc

7: Could not open /proc/sysrq-trigger

13: Unknown options.

14: Wrong parameters for other options.

15: Wrong parameters for memory threshold.

16: Wrong parameters for swap threshold.

102: Could not open /proc/meminfo

103: Could not read /proc/meminfo

104: Could not find a specific entry in /proc/meminfo

105: Could not convert number when parse the contents of /proc/meminfo

# Why not trigger the kernel oom killer?

Earlyoom does not use `echo f > /proc/sysrq-trigger` because the Chrome people
made their browser always be the first (innocent!)  victim by setting
`oom_score_adj` very high. Instead, earlyoom finds out itself by reading through
`/proc/*/status` (actually `/proc/*/statm`, which contains the same information
but is easier to parse programmatically).

Additionally, in recent kernels (tested on 4.0.5), triggering the kernel oom
killer manually may not work at all. That is, it may only free some graphics
memory (that will be allocated immediately again) and not actually kill any
process.

# MEMORY USAGE

About 2 MiB VmRSS. All memory is locked using mlockall() to make sure earlyoom
does not slow down in low memory situations.

# BUGS

If there is zero total swap on earlyoom startup, any `-S` (uppercase "S") values
are ignored, a warning is printed, and default swap percentages are used.

For processes matched by `--prefer`, negative `oom_score_adj` values are not
taken into account, and the process gets an effective `oom_score` of at least
300. See https://github.com/rfjakob/earlyoom/issues/159 for details.

# AUTHOR

The author of earlyoom is Jakob Unterwurzacher ⟨jakobunt@gmail.com⟩.

This manual page was written by Yangfl ⟨mmyangfl@gmail.com⟩, for the Debian
project (and may be used by others).

# SEE ALSO

nohang(8)
