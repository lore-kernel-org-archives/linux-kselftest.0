From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Tue, 31 Jul 2018 00:15:37 -0300
Subject: [PATCH] selftests: membarrier: fix test by checking supported
 commands
In-Reply-To: <9edf8459-aea1-c59e-5d73-112e986777e1@kernel.org>
References: <20180730160543.19056-1-rafael.tinoco@linaro.org>
 <9edf8459-aea1-c59e-5d73-112e986777e1@kernel.org>
Message-ID: <20180731031537.bs64cdcxfqgmjwp4@mobile.celeiro.br>

Hello Shuah,

On Mon, Jul 30, 2018 at 05:32:30PM -0600, Shuah Khan wrote:
> Hi Rafael,
>
> On 07/30/2018 10:05 AM, Rafael David Tinoco wrote:
> > Makes membarrier_test compatible with older kernels (LTS) by checking if
> > the membarrier features exist before running the tests.
> >
> > Link: https://bugs.linaro.org/show_bug.cgi?id=3771
> > Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> > Cc: <stable at vger.kernel.org> #v4.17
> > ---
> >  .../selftests/membarrier/membarrier_test.c    | 69 +++++++++++--------
> >  1 file changed, 41 insertions(+), 28 deletions(-)
> >
> > diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
> > index 6793f8ecc8e7..b96caa096e2f 100644
> > --- a/tools/testing/selftests/membarrier/membarrier_test.c
> > +++ b/tools/testing/selftests/membarrier/membarrier_test.c
> > @@ -225,7 +225,14 @@ static int test_membarrier_global_expedited_success(void)
> >
> >  static int test_membarrier(void)
> >  {
> > -	int status;
> > +	int supported, status;
> > +
> > +	supported = sys_membarrier(MEMBARRIER_CMD_QUERY, 0);
> > +	if (supported < 0) {
> > +		ksft_test_result_fail(
> > +			"sys_membarrier() failed to query supported cmds\n");
> > +		return supported;
> > +	}
> >
>
> ksft_exit_skip() is the right interface to use here. If feature isn't supported,
> it should exit skip as opposed fail.
>

Not sure this is the case here. This part was just a positional change.

This check is extending an existing logic (for MEMBARRIER_CMD_PRIVATE_
EXPEDITED_SYNC_CORE tests). Calling membarrier with MEMBARRIER_CMD_QUERY
will return us MEMBARRIER_CMD_BITMASK, telling us which features are
enabled for the running kernel (thus which tests can be executed).

The query command was added in v4.3 and should (could ?) be considered a
fundament for a working test by now, I suppose, no ?

It is used to decide which further tests to run. Not receiving anything
back from this call would mean something is broken (since at least
MEMBARRIER_CMD_GLOBAL should have always existed as a membarrier
feature/command).

I think your concern is addressed in the beginning of the test.
test_membarrier_query() tests for ENOSYS and calls ksft_exit_skip() if
CONFIG_MEMBARRIER is disabled.

This part is not about checking if the test can run, but which one can.
What do you think ? Tks for reviewing!

-- Rafael D. Tinoco
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
