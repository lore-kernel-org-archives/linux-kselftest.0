Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461555;
	b=tt7bsWA0++rwbIhaAuONzjcH5g4YP3gBZbfXzUq513kleJMZjxQytmqbrpBwRUna5Ikx
	 evIvPho5PNA1dUw1Q/Srnv6TCLLyA8dqvEiR3AMRdkXfMEfblKv1dPnOcyQh/9y2OAN4Q
	 Ama3u0C22K7+B6tOXuTs4rPCtUz/zfN0JvGRjLr9ZcLLcJfBfe/NwjC8UDaYXe8b35NUW
	 poq87d13Q+40u0A4+e+PIS9piqUsyxBUthd6yHgXJBb1SQMYSi58uFgL43DnP0qJWa765
	 gCAYw6ah56fGL7cPsJJFfxf02LlyQsOkRIkuLjTy+LyjmOrbqP1Zgvg2kpGjhmhQihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461555;
	h=DMARC-Filter:DKIM-Signature:Message-Id:To:From:References:
	 X-Lms-Return-Path:Content-Type:Content-Transfer-Encoding:Date:Cc:
	 Subject:Mime-Version:In-Reply-To;
	bh=sYXJfMCvNM38xnLz5UTPMcoa7jKnJKm1Thyvo+ZxcPs=;
	b=AE/o/tCSBB0uZ6LQLpJCXYcDf9I9DRcj6u139xOEAwoil5O1KPlor8BzhnGMVXOcSTTe
	 7vTUw08f6cEjbFEG+dzT/5g8u1Gw0Zs2mqEzfxp5Gr+V+ZxeG0k+ExMxa4Lc8bp8KDObF
	 iN9+yTwWWTavBJzAJupXMkeaWsiY20E9Nv06VaVgYsBmdIRZUj0qUu0+KQWpPPIIOYuaG
	 7EGWp9Nvsf+C8Q9630MwWqetphhcDmhHCGn9kFGe3FFfF5h9PaAv7n5euDLQSt2vrS5SU
	 WdbDTbYdhrdNQAwpyKg7h1ilW543EQzjM1fuIxPH227hz/Zf0v1937ZgoY/RsT0h4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=erBHGhPN;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72033606A31A
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 01:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72033606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=erBHGhPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792461548; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sYXJfMCvNM38xnLz5UTPMcoa7jKnJKm1Thyvo+ZxcPs=;
 b=erBHGhPNmN7aJeRpz8VfDyDKTaXVRnnHthO7eYvW03FplIyO8iohih0H8Wt5jZ+O/pQ0a1
 Nqo+U351m+QFs212NyYO9RLsRFZI1l1FliC4wfpBiw3+VmZBBjvgCvHocMpi5QpRQK9L6I
 B31rB/sbnRqG1NsX4wPUSpxUX9KYr7gpd1aErkFlBfcUofcmVZrXNsSOoJnF4Bs4ME3uUL
 VEC3zfvj8aCtS8YCwbCF9tIkD3WmO46bFvggJE1WlqbWPWo1U8AVYzTXYe1ct0+peJ6oPX
 yaJkjAON6/jl5gMHal/NyJg9JKzLupL/uguld63u0cMoOyKHCi2D5siBC3VYQg==
Message-Id: <451788d5e97cba38274e663d2b7952c593e959be.bdd59707.914f.4934.b1df.56dc1f0c27b2@bytedance.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
From: "Guixiong Wei" <weiguixiong@bytedance.com>
References: <cover.1791428412.git.weiguixiong@bytedance.com> <11ea12962bda75b3e8ef845084546647f79eca38.1791428412.git.weiguixiong@bytedance.com>
	<1c19df7c-76b2-4dd3-b280-d6ab8bb45d4e@intel.com>
X-Lms-Return-Path: <lba+16ad6caea+6afa08+vger.kernel.org+weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:59:04 +0800
Cc: <x86@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	"Guixiong Wei" <weiguixiong@bytedance.com>
Subject: Re: [PATCH v2 2/2] selftests/x86/amx: Test dynamic fpstate cleanup across exec()
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <1c19df7c-76b2-4dd3-b280-d6ab8bb45d4e@intel.com>


> From: "Chang S. Bae"<chang.seok.bae@intel.com>
> Date:=C2=A0 Thu, Oct 15, 2026, 08:19
> Subject:=C2=A0 Re: [PATCH v2 2/2] selftests/x86/amx: Test dynamic fpstate=
 cleanup across exec()
> To: "Guixiong Wei"<weiguixiong@bytedance.com>, <x86@kernel.org>
> Cc: "Thomas Gleixner"<tglx@kernel.org>, "Ingo Molnar"<mingo@redhat.com>, =
"Borislav Petkov"<bp@alien8.de>, "Dave Hansen"<dave.hansen@linux.intel.com>=
, "H . Peter Anvin"<hpa@zytor.com>, "Shuah Khan"<shuah@kernel.org>, <linux-=
kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
> On 10/7/2026 10:59 PM, Guixiong Wei wrote:
> > =C2=A0=C2=A0
> > -int main(void)
> > +static int count_dynamic_fpstates(void)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *line =3D NULL;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t line_size =3D 0;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *fp;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0int count =3D 0;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D fopen("/proc/vmallocinfo", "r");
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fp)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;
>=C2=A0
> The call site doesn't interprete the error code. Instead, you can simply=
=C2=A0
> call fatal_error() here and below on an IO error.
>=C2=A0

Will do. v3 drops the -errno plumbing and calls fatal_error() on
fopen()/getline()/ferror() failures

> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0while (getline(&line, &line_size, fp) >=3D=
 0) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstr(lin=
e, "__xfd_enable_feature") ||
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
strstr(line, "fpstate_realloc"))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0count++;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ferror(fp))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D -EIO=
;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0free(line);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(fp);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;
> > +}
>=C2=A0
> > +static void test_exec(void)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0char iterations_arg[16];
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0char baseline_arg[16];
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0int before, after, delta;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t child;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0int status;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("[RUN]\tCheck dynamic fpstate clean=
up across exec().\n");
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0before =3D count_dynamic_fpstates();
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (before < 0) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("[SKIP]=
\tCannot read /proc/vmallocinfo: %s\n",
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 strerror(-before));
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0child =3D fork();
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (child < 0)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fatal_error("f=
ork");
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!child) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(itera=
tions_arg, sizeof(iterations_arg), "%d",
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 EXEC_TEST_ITERS);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(basel=
ine_arg, sizeof(baseline_arg), "%d", before);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execl("/proc/s=
elf/exe", "amx", EXEC_TEST_ARG, iterations_arg,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0baseline_arg, NULL);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fatal_error("e=
xec");
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>=C2=A0
> This nested exec() with passing numbers via arguments looks more=C2=A0
> complicate than necessary.
>=C2=A0
> Instead, you could put the fork()/exec() sequence in a loop. Before each=
=C2=A0
> exec(), call load_rand_tiledata(), and adjust main() to return=C2=A0
> immediately from the exec test. I found this also reproduces the=C2=A0
> increase in /proc/vmallocinfo.
>=C2=A0
Agreed, much simpler. v3 restructures test_exec() as:

=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < EXEC_TEST_ITERS; i++) {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 child =3D fork();
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 if (child < 0)
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
fatal_error("fork");
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 if (!child) {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
req_xtiledata_perm();
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
load_rand_tiledata(&stashed_tiles);
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
execl("/proc/self/exe", "amx",
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=C2=A0 EXEC_TEST_ARG, NULL);
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
fatal_error("exec");
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 }
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 if (waitpid(child, &status, =
0) !=3D child)
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
fatal_error("waitpid");
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ...
=C2=A0=C2=A0=C2=A0 }

main() short-circuits when argv[1] =3D=3D EXEC_TEST_ARG and exits 0, so
the exec'd child does nothing beyond returning. The baseline/final
counts are taken by the parent around the loop. Confirmed on an AMX
host: unfixed kernel reports EXEC_TEST_ITERS leaked allocations,
fixed kernel reports 0.

> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (waitpid(child, &status, 0) !=3D child)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fatal_error("w=
aitpid");
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WIFEXITED(status) && WEXITSTATUS(statu=
s) =3D=3D KSFT_SKIP) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("[SKIP]=
\tDynamic fpstate allocation was not isolated.\n");
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!WIFEXITED(status) || WEXITSTATUS(stat=
us))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fatal_error("e=
xec test child");
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0after =3D count_dynamic_fpstates();
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (after < 0) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("[SKIP]=
\tCannot read /proc/vmallocinfo after exec(): %s\n",
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 strerror(-after));
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0delta =3D after - before;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!delta) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("[OK]\t=
Dynamic fpstate allocations were freed across exec().\n");
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (delta =3D=3D EXEC_TEST_ITERS)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errx(1, "[FAIL=
]\texec() leaked %d dynamic fpstate allocations",
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 delta);
>=C2=A0
> errx() terminates the entire test, preventing subsequent tests from=C2=A0
> running. Unless this failure makes it unsafe or meaningless to continue,=
=C2=A0
> why not report the failure with printf() and let the remaining tests run?
>=C2=A0

Will do. v3 replaces the errx() with a printf("[FAIL]\t...") and
returns from test_exec() so later subtests still execute. The
failure is still visible in kselftest output.

> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("[SKIP]\tDynamic fpstate vmalloc us=
age changed concurrently.\n");
> > +}
>=C2=A0
> Thanks,
> Chang
>=C2=A0
Thanks,
Guixiong
