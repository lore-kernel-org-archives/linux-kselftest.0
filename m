From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 16 Jan 2018 09:34:54 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: Fix loss of test
	output in run_kselftests.sh
In-Reply-To: <20180116061039.16713-1-mpe@ellerman.id.au>
References: <20180116061039.16713-1-mpe@ellerman.id.au>
Message-ID: <628da78f-243a-0fec-5a2c-e2be3691ba80@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180116163454.5t5j1figdLJZdHd3ULVY7yMUmphPf0WEhdX5kAcXG7A@z>

On 01/15/2018 11:10 PM, Michael Ellerman wrote:
> Commit fbcab13d2e25 ("selftests: silence test output by default")
> changed the run_tests logic as well as the logic to generate
> run_kselftests.sh to redirect test output away from the console.
> 
> As discussed on the list and at kernel summit, this is not a desirable
> default as it means in order to debug a failure the console output is
> not sufficient, you also need access to the test machine to get the
> full test logs. Additionally it's impolite to write directly to
> /tmp/$TEST_NAME on shared systems.
> 
> The change to the run_tests logic was reverted in commit
> a323335e62cc ("selftests: lib.mk: print individual test results to
> console by default"), and instead a summary option was added so that
> quiet output could be requested.
> 
> However the change to run_kselftests.sh was left as-is.
> 
> This commit applies the same logic to the run_kselftests.sh code, ie.
> the script now takes a "--summary" option which suppresses the output,
> but shows all output by default.
> 
> Additionally instead of writing to /tmp/$TEST_NAME the output is
> redirected to the directory where the generated test script is
> located.
> 
> Fixes: fbcab13d2e25 ("selftests: silence test output by default")
> Signed-off-by: Michael Ellerman <mpe at ellerman.id.au>
> ---
>  tools/testing/selftests/Makefile | 9 ++++++++-
>  tools/testing/selftests/lib.mk   | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Thanks for catching this. Applied to linux-kselftest next

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
