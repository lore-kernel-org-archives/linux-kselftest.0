Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930381;
	b=xzmx5lqToQKGv3xvctMnD7GOJM5PtGs+08+PrJdTvOWbVmrgFaFeDXswwyO914sjU1VB
	 GR7mRp24URAWGeUOdMm+oyNHlYVtnUjdeyVmH6DzzEjU9DQkO36AvP2o3onePTWSNtpfG
	 IparMhgdiTOlGDSx/baw4LQJCGYam7ERxmj6VCzlmKPpxwhEtSdUN1RpYT709+AxpI3cD
	 LrXKF9AMCGP0JPcV2fD096pTII0He9QQ1tLSZrucVACybEpiW+yvZ+pZ4hMw4MCODDTgs
	 qgfbTcQnJq4hQz9tIXjSlMqASicp/dDQeImW+s8F9wgRV/E4WGaAEd4n3ACskEJOnwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930381;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V2AA0d9AapQUlVr5l6gQa93xHMo8bcAyq5VmqdwWGEA=;
	b=TXtJq4eHxkp2O9vCo40RjSGbcWfXh/ongSVqy3Tmz15bNTu8p7PwUII1z18CMGGHztXe
	 tTmrDFx6l/sJ3DptYOdVkbwpTdvOWFghyuNw1ux8790OvxseeD65Ex6B7e4Z3UwTanYi/
	 U3vgi+m37JiTzX81HGx+aCQbF8ImE1inlluKwpqqMlmd7YC/9TfvMyHx8tfX8RQDmL+A5
	 STDH9eNOkuIDJtWwommLIlt5C/WhD3D6QOtb2bNuSJwhcsskNEbwSON9f0gNFSZHPCZiK
	 zlD93uvaWmTC3zl8Bea0mJARraA05VpCE4VY8zbUoxqAu+rnTxwLeYpvPuG5w3ZnUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="u2di2a/X";
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE185606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 15:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE185606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u2di2a/X
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GP4eRgS9mLzEhiTyfcPm1vddtCMZq44xNGzZVqKEmCA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794930378; v=1; x=1795535178;
 b=u2di2a/XoMm+xBvuSZBXKHZ+D44OKdhjquP8knUGZAWf0YHgw7rrlCrcYhndxFn1QOywHByz
 fAjFZjMaZA+LLg1myUEvCpmpn2QAyJ25PNnC+i+egdUOXMNfiOZLp2oMkIIb2DrAKiMeI7locvB
 PWoQ1dpdUHLTZa2OIKOYjLQU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e9d4560bd6cb360;
	Tue, 17 Nov 2026 15:46:18 +0000
X-Mizu-Trace-ID: 4e9d4560bd6cb360
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 15:46:19 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, Renzo Davoli <renzo@cs.unibo.it>
CC: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 "Dmitry V . Levin" <ldv@strace.io>, Alexey Gladkov <legion@kernel.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, Shuah Khan <shuah@kernel.org>,
 strace-devel@lists.strace.io, linux-api@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/2=5D_selftests/ptrace=3A_check_that_PT?=
 =?US-ASCII?Q?RACE=5FSET=5FSYSCALL=5FINFO_rejects_invalid_error_values?=
In-Reply-To: <20261116153642.a8dddc43f53fed0402283dfa@linux-foundation.org>
References: <20261116134050.505355-1-renzo@cs.unibo.it> <20261116134050.505355-3-renzo@cs.unibo.it> <20261116153642.a8dddc43f53fed0402283dfa@linux-foundation.org>
Message-ID: <7ABEC58C-5AAE-4FE2-9DBE-F068194A7406@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 November 2026 23:36:42 GMT, Andrew Morton <akpm@linux-foundation.org>
wrote:
>On Mon, 16 Nov 2026 14:40:46 +0100 Renzo Davoli <renzo@cs.unibo.it> wrote:
>
>> At every exit stop of the set_syscall_info test, try to set with
>> is_error set a few values outside [-MAX_ERRNO, -1], check that
>> PTRACE_SET_SYSCALL_INFO fails with ERANGE and that the return value
>> of the system call is left untouched.
>
>Thanks.
>
>LLM suggested a little fixup here, please check.
>
>
>
>From: Andrew Morton <akpm@linux-foundation.org>
>Subject: selftests/ptrace: test the lowest valid syscall error
>Date: Mon, 16 Nov 2026 22:27:14 +0000
>
>PTRACE_SET_SYSCALL_INFO must reject values below -MAX_ERRNO while
>accepting -MAX_ERRNO itself. Name the bound locally for this userspace
>selftest, and add a successful exit-stop case at that boundary. Retain
>the existing -EISDIR case. The tracee checks the resulting errno.
>
>Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

>Cc: Renzo Davoli <renzo@cs.unibo.it>
>
> tools/testing/selftests/ptrace/set_syscall_info.c |   25 +++++++++++-
> 1 file changed, 24 insertions(+), 1 deletion(-)
>
>--- a/tools/testing/selftests/ptrace/set_syscall_info.c~selftests-ptrace-check-that-ptrace_set_syscall_info-rejects-invalid-error-values-fix
>+++ a/tools/testing/selftests/ptrace/set_syscall_info.c
>@@ -15,6 +15,8 @@
> #include <linux/types.h>
> #include <linux/ptrace.h>
> 
>+#define MAX_ERRNO 4095
>+
> #if defined(_MIPS_SIM) && _MIPS_SIM == _MIPS_SIM_NABI32
> /*
>  * MIPS N32 is the only architecture where __kernel_ulong_t
>@@ -131,7 +133,7 @@ static const long long bad_error_rval[]
> 	0,
> 	1,
> 	ESRCH,
>-	-4095 - 1,	/* -MAX_ERRNO - 1 */
>+	-MAX_ERRNO - 1,
> 	-2147483647LL - 1,
> #if __SIZEOF_LONG__ > 4
> 	0x100000000LL,
>@@ -325,6 +327,27 @@ TEST(set_syscall_info)
> 			}
> 		},
> 
>+		/* change scno, change non-error rval to -MAX_ERRNO */
>+		{
>+			{
>+				{
>+					__NR_chdir,
>+					{
>+						dummy[0], dummy[1], dummy[2],
>+						dummy[3], dummy[4], dummy[5]
>+					}
>+				}, {
>+					__NR_getppid,
>+					{
>+						dummy[0], dummy[1], dummy[2],
>+						dummy[3], dummy[4], dummy[5]
>+					}
>+				}
>+			}, {
>+				{ 0, tracer_pid }, { 1, -MAX_ERRNO }
>+			}
>+		},
>+
> 		/* change scno and all args, change non-error rval */
> 		{
> 			{
>_
>
>


--- Thanks!
