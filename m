From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Mon, 2 Apr 2018 15:58:49 +0900
Subject: [PATCH] selftests/ftrace: fix spelling mistake: "tiggers" ->
 "triggers"
In-Reply-To: <20180329172431.8171-1-colin.king@canonical.com>
References: <20180329172431.8171-1-colin.king@canonical.com>
Message-ID: <20180402155849.109fcb9c5d4653fc7adcddf1@kernel.org>

On Thu, 29 Mar 2018 18:24:31 +0100
Colin King <colin.king at canonical.com> wrote:

> From: Colin Ian King <colin.king at canonical.com>
> 
> Trivial fix to spelling mistake in message text
> 
> Signed-off-by: Colin Ian King <colin.king at canonical.com>

Oops, thanks!

Acked-by: Masami Hiramatsu <mhiramat at kernel.org>

> ---
>  tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
> index c5ef8b9d02b3..1b8faf4c318c 100644
> --- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
> +++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
> @@ -35,7 +35,7 @@ do_reset
>  
>  reset_trigger
>  
> -echo "Test histogram multiple tiggers"
> +echo "Test histogram multiple triggers"
>  
>  echo 'hist:keys=parent_pid:vals=child_pid' > events/sched/sched_process_fork/trigger
>  echo 'hist:keys=parent_comm:vals=child_pid' >> events/sched/sched_process_fork/trigger
> -- 
> 2.15.1
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
