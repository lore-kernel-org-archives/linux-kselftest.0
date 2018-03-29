From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 29 Mar 2018 13:31:02 -0400
Subject: [PATCH] selftests/ftrace: fix spelling mistake: "tiggers" ->
 "triggers"
In-Reply-To: <20180329172431.8171-1-colin.king@canonical.com>
References: <20180329172431.8171-1-colin.king@canonical.com>
Message-ID: <20180329133102.6061ba66@gandalf.local.home>

On Thu, 29 Mar 2018 18:24:31 +0100
Colin King <colin.king at canonical.com> wrote:

> From: Colin Ian King <colin.king at canonical.com>
> 
> Trivial fix to spelling mistake in message text
> 
> Signed-off-by: Colin Ian King <colin.king at canonical.com>
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

Oh Pooh! (/me wonders who gets that)

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

-- Steve

> +echo "Test histogram multiple triggers"
>  
>  echo 'hist:keys=parent_pid:vals=child_pid' > events/sched/sched_process_fork/trigger
>  echo 'hist:keys=parent_comm:vals=child_pid' >> events/sched/sched_process_fork/trigger

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
