From: lpechacek@suse.com (Libor Pechacek)
Date: Tue, 24 Apr 2018 19:19:02 +0200
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <c3f1a6b8-5eba-84e1-9d0b-8009c9087022@redhat.com>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
 <20180420125605.e4eye7ncukyivleh@fm.suse.cz>
 <20180423144317.too6ucui37m7oj7y@redhat.com>
 <c3f1a6b8-5eba-84e1-9d0b-8009c9087022@redhat.com>
Message-ID: <20180424171902.z4ymubblh2dtcp4h@fmn.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180424171902.N1JCURdJOTG5T5uTJz7twpkmc_U_n3Hqd8TiYYnj_XU@z>

On Tue 24-04-18 11:50:28, Joe Lawrence wrote:
> On 04/23/2018 10:43 AM, Joe Lawrence wrote:
> > On Fri, Apr 20, 2018@02:56:05PM +0200, Libor Pechacek wrote:
> >> On Thu 12-04-18 10:54:31, Joe Lawrence wrote:
> >>> +	fi
> >>> +	echo "$ret" > /dev/kmsg
> >>> +}
> >>> +
> >>> +# unload_mod(modname) - unload a kernel module
> >>> +#	modname - module name to unload
> >>> +function unload_mod() {
> >>> +	local mod="$1"
> >>> +
> >>> +	# Wait for module reference count to clear ...
> >>> +	local i=0
> >>> +	while [[ $(cat /sys/module/"$mod"/refcnt) != "0" ]]; do
> >>> +		i=$((i+1))
> >>> +		if [[ $i -eq $MAX_RETRIES ]]; then
> >>> +			die "failed to unload module $mod (refcnt)"
> >>> +		fi
> >>> +		sleep $RETRY_INTERVAL
> >>> +	done
> >>
> >> The repeating pattern of "while <some test>; do <count>; if <count beyond max
> >> retries>; then <die>..." seems to ask for encapsulation.
> >>
> > 
> > Yeah I definitely agree.  I think at some point I had acquired
> > bash-fatigue;  I wasn't sure how to cleanly wrap <some test> around that
> > extra logic.  In C, I could do something clever with macros or a
> > callback function.  My bash scripting isn't great, so I copied and
> > pasted my way through it.  Suggestions welcome.
> > 
> 
> Okay, here's what I came up with... first off, do you prefer this kind
> of transition check vs. looking only at a specific module?
> 
>   # check_transition() - verify that no livepatch transition in effect
>   function check_transition() {
>   	grep -q '^1$' /sys/kernel/livepatch/*/transition 2>/dev/null
>   }

Elegant!

> then wrap the retry/timeout logic like:
> 
>   # retry_cmd(cmd) - loop a command until it is successful or
>   #		   $MAX_RETRIES, sleeping $RETRY_INTERVAL in
>   #		   between tries
>   # 	cmd - command and its arguments to run
>   function retry_cmd() {
>   	local cmd="$*"
>   	local i=0
>   	while eval "$cmd"; do
>   		i=$((i+1))
>   		[[ $i -eq $MAX_RETRIES ]] && return 1
>   		sleep $RETRY_INTERVAL
>   	done
>   	return 0
>   }
> 
> and the callers to something like:
> 
>   # wait_for_transition() - wait until all livepatch transitions clear
>   function wait_for_transition() {
>   	retry_cmd check_transition ||
>   		die "failed to complete transition"
>   }

My idea was to make the die() part of the retry loop. This implementation is,
however, more flexible.

> I can create similar check() functions to eval for sysfs file existence,
> file content, reference count, etc. to remove all the other
> retry/timeout loops.

I think check_*() functions can be avoided for trivial tests. retry_cmd() can
be passed a more complex command string than a single function name.

Regarding naming, I'd say wait_false() or similar would better describe what
retry_cmd() does. 

Libor
-- 
Libor Pechacek
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
