From: mcgrof at kernel.org (Luis Chamberlain)
Date: Tue, 22 Jan 2019 11:43:52 -0800
Subject: [PATCH] selftests: kmod: worked on errors which breaks the
 overall execution of the test script
In-Reply-To: <20190117210258.7871-1-jeffrin@rajagiritech.edu.in>
References: <20190117210258.7871-1-jeffrin@rajagiritech.edu.in>
Message-ID: <20190122194352.GA11489@garbanzo.do-not-panic.com>

On Fri, Jan 18, 2019 at 02:32:58AM +0530, Jeffrin Jose T wrote:
> The kmod.sh script breaks

First thanks for the patch! But now let's get to it: on what
distribution and version of bash does this break? The commit log should
refer to this and it would help me confirm the issue.

> because an array is passed

Which is the array?

> as input
> instead of a single element input.This patch takes elements
> one at a time and passed as input to the condition statement
> which in turn fixes the error.There was an issue which had
> the need for passing a single digit to the condition statement
> which is fixed using regular expression.
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
> ---
>  tools/testing/selftests/kmod/kmod.sh | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/kmod/kmod.sh b/tools/testing/selftests/kmod/kmod.sh
> index 0a76314b4414..49b273c3646e 100755
> --- a/tools/testing/selftests/kmod/kmod.sh
> +++ b/tools/testing/selftests/kmod/kmod.sh
> @@ -526,9 +526,12 @@ function run_all_tests()
>  		TEST_ID=${i%:*:*}
>  		ENABLED=$(get_test_enabled $TEST_ID)
>  		TEST_COUNT=$(get_test_count $TEST_ID)
> -		if [[ $ENABLED -eq "1" ]]; then
> -			test_case $TEST_ID $TEST_COUNT
> -		fi

get_test_enabled() is supposed to do what you do open-handed here.
So the better question is why are you getting an array returned
for your version of bash.

> +		for j in $ENABLED ; do
> +		         CHECK=${j#*:*:}
> +			 if [[ $CHECK -eq "1" ]]; then
> +			     test_case $TEST_ID $TEST_COUNT
> +			 fi
> +		done
>  	done
>  }
>  
> -- 
> 2.20.1

  Luis
