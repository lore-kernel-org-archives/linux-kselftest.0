From: lpechacek at suse.cz (Libor Pechacek)
Date: Tue, 24 Apr 2018 19:35:11 +0200
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <20180423144317.too6ucui37m7oj7y@redhat.com>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
 <20180420125605.e4eye7ncukyivleh@fm.suse.cz>
 <20180423144317.too6ucui37m7oj7y@redhat.com>
Message-ID: <20180424173511.frrpg45bndwffvkh@fmn.suse.cz>

On Mon 23-04-18 10:43:17, Joe Lawrence wrote:
> On Fri, Apr 20, 2018 at 02:56:05PM +0200, Libor Pechacek wrote:
[...]
> > > +
> > > +	# Wait for livepatch transition  ...
> > > +	local i=0
> > > +	while [[ $(cat /sys/kernel/livepatch/"$mod"/transition) != "0" ]]; do
> > > +		i=$((i+1))
> > > +		if [[ $i -eq $MAX_RETRIES ]]; then
> > > +			die "failed to complete transition for module $mod"
> > 
> > FWIW, qa_test_klp tests dump blocking processes' stacks at this place for more
> > efficient information exchange between tester and developer.
> > (klp_dump_blocking_processes() in https://github.com/lpechacek/qa_test_klp,
> > file klp_tc_functions.sh)
> > 
> 
> ... If I read the klp_dump_blocking_processes() code correctly and
> understand your comment, you are suggesting that reading (any)
> /sys/kernel/livepatch/*/transition would be simpler?  No module
> parameter needed as only one should ever be transitioning at a given
> time?

Exactly.

[...]
> > > +#	modname - module name to unload
> > > +function disable_lp() {
> > > +	local mod="$1"
> > 
> >    ^^^VVVV - mixed indentation with tabs and spaces. Intentional?
> > 	     (same in set_pre_patch_ret and several other places)
> > 
> 
> Ahh, thanks for spotting that.  checkpatch doesn't seem to complain
> about shell script indentation.  Funny that shellcheck didn't either.
> 
> > > +
> > > +        echo "% echo 0 > /sys/kernel/livepatch/$mod/enabled" > /dev/kmsg
> > > +        echo 0 > /sys/kernel/livepatch/"$mod"/enabled
> > 
> > How about folding disable_lp functionality into module unload function? That
> > would save extra invocation of disable_lp in test scripts.
> > 
> 
> Maybe this is just a stylistic thing, but I preferred the test scripts
> to be rather explicit about what they are doing.  Instead of a do-it-all
> test_it() call, I liked how part_a(), part_b(), part_c() spelled things
> out.
> 
> In some instances, these functions were once combined, but I ran
> into a scenario where I needed only a part of that function because I
> was injecting an error.  That experience lead me to keep the test "api"
> more RISC than CISC :) 

Understood. Thanks for explanation.

[...]
> > > diff --git a/tools/testing/selftests/livepatch/test-callbacks.sh b/tools/testing/selftests/livepatch/test-callbacks.sh
> > > new file mode 100755
> > > index 000000000000..739d09bb3cff
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/livepatch/test-callbacks.sh
> > > @@ -0,0 +1,607 @@
> > > +#!/bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (C) 2018 Joe Lawrence <joe.lawrence at redhat.com>
> > > +
> > > +. functions.sh
> > 
> > This assumes functions.sh is in $CWD.
> > 
> 
> Good point.  In the past, I've used something like:
> 
>   SCRIPTDIR="$(readlink -f $(dirname $(type -p $0)))"
> 
> but I notice that not many selftests do anything special at all:
> 
>   % grep '^\. ' $(find . tools/testing/selftests/ -name '*.sh')
>   ...
> 
> only the perf tests do, and they use ". $(dirname $0)/..." so I'll use
> that convention for these tests.

Indeed! I'm for following the crowd.

Thanks for putting the scripts together. Good job done!

Libor
-- 
Libor Pechacek
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
