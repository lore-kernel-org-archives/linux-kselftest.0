From: mingo@kernel.org (Ingo Molnar)
Date: Mon, 11 Feb 2019 09:45:43 +0100
Subject: [PATCH 1/2] selftests/x86/fsgsbase: Indirect output through a
 wrapper function
In-Reply-To: <20190203134017.9375-2-broonie@kernel.org>
References: <20190203134017.9375-1-broonie@kernel.org>
 <20190203134017.9375-2-broonie@kernel.org>
Message-ID: <20190211084543.GA62722@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190211084543.WF3mRqczFbZf9sOBr16i42UpnzHfhZ4FylR7Y91AO4I@z>


* Mark Brown <broonie@kernel.org> wrote:

> In preparation for a change to make this test run repeatedly which
> would generate huge amounts of output as is indirect all the printf()
> calls in the program through a wrapper and add a quiet flag which can
> be used to suppress the output.  This is fairly quick and dirty, I'm not
> 100% sure what would be idiomatic here.
> 
> Signed-off-by: Mark Brown <broonie at kernel.org>
> ---
>  tools/testing/selftests/x86/fsgsbase.c | 52 ++++++++++++++++----------
>  1 file changed, 32 insertions(+), 20 deletions(-)

So this really loses useful output when there is a failure. After this 
patch I get:

  dagon:~/tip/tools/testing/selftests/x86> ./fsgsbase_64 -vv
  [FAIL] 24 errors detected in 1 tries

Not very helpful, and no real command-line way to see the failures.

While previously it would tell me what's going on:

 dagon:~/tip/tools/testing/selftests/x86> ./fsgsbase_64  | grep FAIL
 [FAIL]	GS/BASE changed from 0x1/0x1 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x1 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x1 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x1 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x1 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x1 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x1 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x1 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x1 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x1 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x1 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x1 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x200000000 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x200000000 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x200000000 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x200000000 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x200000000 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x200000000 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x200000000 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x200000000 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x200000000 to 0x3/0x0
 [FAIL]	GS/BASE changed from 0x1/0x200000000 to 0x1/0x0
 [FAIL]	GS/BASE changed from 0x2/0x200000000 to 0x2/0x0
 [FAIL]	GS/BASE changed from 0x3/0x200000000 to 0x3/0x0

So I believe at least failure messages need to be preserved.

Thanks,

	Ingo
