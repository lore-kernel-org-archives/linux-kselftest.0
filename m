From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 2 Aug 2018 10:02:40 +0900
Subject: [PATCH 11/25] selftests/ftrace: Improve kprobe on module
 testcase to load/unload module
In-Reply-To: <153269370853.3084.10985190108092225790.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
 <153269370853.3084.10985190108092225790.stgit@devbox>
Message-ID: <20180802100240.a27b72abe375c5817d970a0c@kernel.org>

On Fri, 27 Jul 2018 21:15:08 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> @@ -4,11 +4,18 @@
>  
>  [ -f kprobe_events ] || exit_unsupported # this is configurable
>  
> +rmmod trace-printk ||:
> +if ! modprobe trace-printk.ko ; then
> +  echo "No trace-printk sample module - please make CONFIG_SAMPLE_TRACE_PRINTK=
> +m"
> +  exit_unresolved;
> +fi
> +
> +MOD=trace_printk
> +FUNC=trace_printk_irq_work

Hmm, this caused a problem with CONFIG_KPROBE_EVENTS_ON_NOTRACE=n.
However, as far as I can see, the trace_printk_irq_work() is not
marked as notrace...

Anyway, I'll find another better module to test.

Thanks,


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
