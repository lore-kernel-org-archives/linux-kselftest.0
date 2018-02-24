From: dvhart@infradead.org (Darren Hart)
Date: Sat, 24 Feb 2018 13:42:44 -0800
Subject: [PATCH 5/5] selftests: futex Makefile add top level TAP header
 echo to RUN_TESTS
In-Reply-To: <bec2e6c01cbf3b2f6dc49e022a2a7543fc7f3182.1519423341.git.shuahkh@osg.samsung.com>
References: <cover.1519423340.git.shuahkh@osg.samsung.com>
 <bec2e6c01cbf3b2f6dc49e022a2a7543fc7f3182.1519423341.git.shuahkh@osg.samsung.com>
Message-ID: <20180224214244.GA31352@fury>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180224214244.Z9TmPVxAKwbtZpJyljYCoLVYcVq1LkwYPDaS25cNdaQ@z>

On Fri, Feb 23, 2018@03:11:40PM -0700, Shuah Khan wrote:
> Add top level TAP header echo, testname and separator line to make
> the output consistent with the common run_tests target.

No objection to the changes, but I'll echo Ingo's request for a more
detailed justification for why these changes are warranted. We've seen
this a few times with recent changes to kselftests, I think too much
might be being assumed regarding the individual test author's tracking
of the core of the kselftests ongoing work.

> 
> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
> ---
>  tools/testing/selftests/futex/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
> index cea4adcd42b8..3e9a9d7b4de1 100644
> --- a/tools/testing/selftests/futex/Makefile
> +++ b/tools/testing/selftests/futex/Makefile
> @@ -18,6 +18,9 @@ all:
>  	done
>  
>  override define RUN_TESTS
> +	@echo "TAP version 13";
> +	@echo "selftests: futex";
> +	@echo "========================================";
>  	@cd $(OUTPUT); ./run.sh
>  endef
>  
> -- 
> 2.14.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
