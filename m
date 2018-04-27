From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Fri, 27 Apr 2018 16:13:40 -0600
Subject: [PATCH 4.17-rc2] selftests: Fix lib.mk run_tests target shell
 script
In-Reply-To: <20180427215541.25007-1-mathieu.desnoyers@efficios.com>
References: <20180427215541.25007-1-mathieu.desnoyers@efficios.com>
Message-ID: <f126217d-df7e-996f-e563-2cbc361e4137@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180427221340.WkIKbqN4URmACW80-y1rFlrQUDQeaIXxU20ZgoAGg_A@z>

On 04/27/2018 03:55 PM, Mathieu Desnoyers wrote:
> Within run_tests target, the whole script needs to be executed within
> the same shell and not as separate subshells, so the initial test_num
> variable set to 0 is still present when executing "test_num=`echo
> $$test_num+1 | bc`;".
> 
> Demonstration of the issue (make run_tests):
> 
> TAP version 13
> (standard_in) 1: syntax error
> selftests: basic_test
> ========================================
> ok 1.. selftests: basic_test [PASS]
> (standard_in) 1: syntax error
> selftests: basic_percpu_ops_test
> ========================================
> ok 1.. selftests: basic_percpu_ops_test [PASS]
> (standard_in) 1: syntax error
> selftests: param_test
> ========================================
> ok 1.. selftests: param_test [PASS]
> 
> With fix applied:
> 
> TAP version 13
> selftests: basic_test
> ========================================
> ok 1..1 selftests: basic_test [PASS]
> selftests: basic_percpu_ops_test
> ========================================
> ok 1..2 selftests: basic_percpu_ops_test [PASS]
> selftests: param_test
> ========================================
> ok 1..3 selftests: param_test [PASS]
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
> Fixes: 1f87c7c15d7 ("selftests: lib.mk: change RUN_TESTS to print messages in TAP13 format")
> CC: Shuah Khan <shuahkh at osg.samsung.com>
> CC: linux-kselftest at vger.kernel.org
> ---
>  tools/testing/selftests/lib.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 195e9d4739a9..c1b1a4dc6a96 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -20,10 +20,10 @@ all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
>  
>  .ONESHELL:
>  define RUN_TESTS
> -	@export KSFT_TAP_LEVEL=`echo 1`;
> -	@test_num=`echo 0`;
> -	@echo "TAP version 13";
> -	@for TEST in $(1); do				\
> +	@export KSFT_TAP_LEVEL=`echo 1`;		\
> +	test_num=`echo 0`;				\
> +	echo "TAP version 13";				\
> +	for TEST in $(1); do				\
>  		BASENAME_TEST=`basename $$TEST`;	\
>  		test_num=`echo $$test_num+1 | bc`;	\
>  		echo "selftests: $$BASENAME_TEST";	\
> 

Great. Applied to linux-kselftest fixes for 4.17-rc4

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
