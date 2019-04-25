From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 25 Apr 2019 12:45:58 -0400
Subject: [PATCH] rcutorture: Tweak kvm options
In-Reply-To: <20190424073446.8577-1-bigeasy@linutronix.de>
References: <20190424073446.8577-1-bigeasy@linutronix.de>
Message-ID: <20190425164558.GA233442@google.com>

On Wed, Apr 24, 2019 at 09:34:46AM +0200, Sebastian Andrzej Siewior wrote:
> In one of my rcutorture tests the TSC clocksource got marked unstable
> due to a large difference in the TSC value. I'm not sure if the guest
> run for a long time with disabled interrupts or if the host was very
> busy and didn't schedule the guest for some time.
> I took a look on the qemu/KVM options and decided to update the options:
> - Use kvm{32|64} as CPU. We could probably use `host' (like ARM does)
>   for maximum available features but since we don't run any userland I'm
>   not sure if it makes any difference.
> 
> - Drop the "noapic" option, enable TSC deadline timer. There is no
>   history why the APIC was disabled, I see no reason for it. The
>   deadline timer is probably "nicer".

I was wondering why the tsc deadline timer can't just be the default in the
kernel if it is "nicer" / "better" , and why does it need to be an option.

> 
> - Additional config options. It ensures that the kernel knowns that it
>   runs as a kvm guest and can use virt devices like the kvm-clock as
>   clocksource. The kvm-clock was the main motivation here.
> 
> - I didn't add a random HW device. It would make the random device ready
>   earlier (not it doesn't complete the initialisation at all) but I
>   doubt that there is any need for this.

Didn't follow this point about "random HW device". It looks like there is no
part of the patch that matches this comment. There was no "random HW device"
needed for this change of the clocksource, so could you clarify what this means?

Otherwise lgtm, thanks!

Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>

- Joel

> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
> ---
>  tools/testing/selftests/rcutorture/bin/functions.sh | 13 ++++++++++++-
>  .../selftests/rcutorture/configs/rcu/CFcommon       |  4 ++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
> index 6bcb8b5b2ff22..be3c5c73d7e79 100644
> --- a/tools/testing/selftests/rcutorture/bin/functions.sh
> +++ b/tools/testing/selftests/rcutorture/bin/functions.sh
> @@ -172,7 +172,7 @@ identify_qemu_append () {
>  	local console=ttyS0
>  	case "$1" in
>  	qemu-system-x86_64|qemu-system-i386)
> -		echo noapic selinux=0 initcall_debug debug
> +		echo selinux=0 initcall_debug debug
>  		;;
>  	qemu-system-aarch64)
>  		console=ttyAMA0
> @@ -191,8 +191,19 @@ identify_qemu_append () {
>  # Output arguments for qemu arguments based on the TORTURE_QEMU_MAC
>  # and TORTURE_QEMU_INTERACTIVE environment variables.
>  identify_qemu_args () {
> +	local KVM_CPU=""
> +	case "$1" in
> +	qemu-system-x86_64)
> +		KVM_CPU=kvm64
> +		;;
> +	qemu-system-i386)
> +		KVM_CPU=kvm32
> +		;;
> +	esac
>  	case "$1" in
>  	qemu-system-x86_64|qemu-system-i386)
> +		echo -machine q35,accel=kvm
> +		echo -cpu ${KVM_CPU},x2apic=on,tsc-deadline=on,hypervisor=on,tsc_adjust=on
>  		;;
>  	qemu-system-aarch64)
>  		echo -machine virt,gic-version=host -cpu host
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/CFcommon b/tools/testing/selftests/rcutorture/configs/rcu/CFcommon
> index d2d2a86139db1..322d5d40443cd 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/CFcommon
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/CFcommon
> @@ -1,2 +1,6 @@
>  CONFIG_RCU_TORTURE_TEST=y
>  CONFIG_PRINTK_TIME=y
> +CONFIG_HYPERVISOR_GUEST=y
> +CONFIG_PARAVIRT=y
> +CONFIG_PARAVIRT_SPINLOCKS=y
> +CONFIG_KVM_GUEST=y
> -- 
> 2.20.1
> 
