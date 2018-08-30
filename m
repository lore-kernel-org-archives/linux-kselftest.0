From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 16:53:01 +0900
Subject: [PATCH v2 32/32] selftests/ftrace: Add blktrace testcase
In-Reply-To: <20180824222219.1d8aae6f@vmware.local.home>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443785794.23257.1676529524763163046.stgit@devbox>
 <20180824222219.1d8aae6f@vmware.local.home>
Message-ID: <20180830165301.b6a66909351610e4a8f53e15@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830075301.lrTJs3gephn7HaikHq8lJtbcdtAUEDrU0_0vc1i6bRE@z>

On Fri, 24 Aug 2018 22:22:19 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 17 Aug 2018 01:44:18 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Add a basic testcase for blktrace. For making it portable,
> > this test uses a loop device.
> 
> blktrace is a bit special, as it's maintained by the block subsystem
> and not really truly part of ftrace. It lives in the tracing directory,
> but the changes go through Jens's tree. I'm guessing that Jens already
> has tests for this. Not sure we should add a test to the ftrace
> selftests for this tracer.

I see. But as far as it is in the ftrace, and can easily wake it up
from tracefs interface, I think we can have a basic testcase in
ftracetest, just for keeping it doesn't break anything.

> 
> Jens, you have thoughts on this?

Jens, ping?

Thank you,

> 
> -- Steve
> 
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> > ---
> >  tools/testing/selftests/ftrace/config              |    1 
> >  .../testing/selftests/ftrace/test.d/tracer/blk.tc  |   91 ++++++++++++++++++++
> >  2 files changed, 92 insertions(+)
> >  create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/blk.tc
> > 
> > diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
> > index c2c8de4fafff..d999032442e1 100644
> > --- a/tools/testing/selftests/ftrace/config
> > +++ b/tools/testing/selftests/ftrace/config
> > @@ -5,6 +5,7 @@ CONFIG_TRACER_SNAPSHOT=y
> >  CONFIG_STACK_TRACER=y
> >  CONFIG_HIST_TRIGGERS=y
> >  CONFIG_SCHED_TRACER=y
> > +CONFIG_BLK_DEV_IO_TRACE=y
> >  CONFIG_PREEMPT_TRACER=y
> >  CONFIG_IRQSOFF_TRACER=y
> >  CONFIG_PREEMPTIRQ_DELAY_TEST=m
> > diff --git a/tools/testing/selftests/ftrace/test.d/tracer/blk.tc b/tools/testing/selftests/ftrace/test.d/tracer/blk.tc
> > new file mode 100644
> > index 000000000000..9d6e72810c8a
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/tracer/blk.tc
> > @@ -0,0 +1,91 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL2.0
> > +# description: Test blktrace
> > +
> > +IMG=$TMPDIR/fs.img
> > +MNTDIR=$TMPDIR/mnt
> > +
> > +if ! grep -wq "blk" available_tracers ; then
> > +  echo "blktrace is not supported"
> > +  exit_unsupported
> > +fi
> > +
> > +available_fs() { #fstype
> > +  grep -q $1 /proc/filesystems && which mkfs.$1
> > +}
> > +
> > +if available_fs ext3; then
> > +  FSTYPE=ext3
> > +elif available_fs ext4; then
> > +  FSTYPE=ext4
> > +elif available_fs ext2; then
> > +  FSTYPE=ext2
> > +elif available_fs xfs; then
> > +  FSTYPE=xfs
> > +elif available_fs btrfs; then
> > +  FSTYPE=btrfs
> > +else
> > +  echo "No available block-based filesystems"
> > +  exit_unresolved
> > +fi
> > +
> > +if ! which losetup; then
> > +  echo "No losetup found"
> > +  exit_unresolved
> > +fi
> > +LODEV=`losetup -f`
> > +LODEVTRACE=/sys/block/`basename $LODEV`/trace
> > +
> > +do_cleanup() {
> > +  if [ -d $MNTDIR ]; then
> > +   umount $MNTDIR ||:
> > +  fi
> > +  losetup -d $LODEV ||:
> > +  rm -f $IMG
> > +}
> > +
> > +# workload failure is not a tracer's failure
> > +workload_fail() {
> > +  do_cleanup
> > +  echo "Failed to run workload"
> > +  exit_unresolved
> > +}
> > +
> > +do_fail() {
> > +  do_cleanup
> > +  echo "Test failed"
> > +  exit 1
> > +}
> > +
> > +enable_lodevtrace() {
> > +  if [ `cat $LODEVTRACE/enable` -ne 1 ]; then
> > +    echo 1 > $LODEVTRACE/enable
> > +  fi
> > +}
> > +
> > +echo blk > current_tracer
> > +
> > +dd if=/dev/zero of=$IMG bs=1M count=10 &&\
> > +losetup $LODEV $IMG &&\
> > +mkfs.$FSTYPE $LODEV &&\
> > +mkdir -p $MNTDIR &&\
> > +mount -t $FSTYPE $LODEV $MNTDIR &&\
> > +enable_lodevtrace &&\
> > +dd if=/dev/urandom of=$MNTDIR/testfile bs=1M count=1 &&\
> > +sync &&\
> > +umount $MNTDIR || workload_fail
> > +
> > +grep -q "[dd]" trace || do_fail
> > +grep -q "[umount]" trace || do_fail
> > +echo > trace
> > +
> > +losetup $LODEV $IMG &&\
> > +mount -t $FSTYPE $LODEV $MNTDIR &&\
> > +cat $MNTDIR/testfile > /dev/null &&\
> > +echo 0 > $LODEVTRACE/enable &&\
> > +umount $MNTDIR || workload_fail
> > +
> > +grep -q "[cat]" trace || do_fail
> > +grep -q "[mount]" trace || do_fail
> > +
> > +do_cleanup
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
