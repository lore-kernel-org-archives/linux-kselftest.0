Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCB3403F5
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787525588; cv=none; b=YGXFz0eP0To2vROWKmIJW6KhZVpnz9zGPAfO6as/iW3CFs1tZ/dv/1kbHj+eMafeDSwl+96HbawHXHeMvAru+d1ie209miU3kl1kvk1cNW+F0BTXE8zIjxD3bub14Lcy/N/Hyc2Yx0+So4oQu69NPajmYHMKJZSZ6xoAO9aQkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787525588; c=relaxed/simple;
	bh=McQxEWizuwvYe0QY6yDsUQEQxAe6VHDqWj1hr73k0Og=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GFU0x8jP2tUOeImswHdUtgeFKci9TKuEC9e18CnqiJlZdk15Nr3+pCPRhshdFTimc9+jP2he30q20bMKNcV1ADeJaGS8NaWmARkeJ+bct4bVefQCtOk+JHeRCllh/QJa/3l/BSfvQFH/WWHB8DYiqQ6VgS1tKvbBnVfIp2CsojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2wB9K2f; arc=none smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2wB9K2f"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15e0279316so136812466b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787525585; x=1788130385; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cF/nKW6BzduyHSxJj4+7z+12HQgDeEpMqu/UQzO/8HU=;
        b=R2wB9K2fPG6lZLA3M7nYDt+U2KdhpuLdC2/gEG8O02b+etx7FqEYo/01utZyMeIxhm
         DVsFlZkCtfSKy0c9/oaXd5JAHBpzQaGdr+i/5jvFL7d9N7K8AVObG1W0xO74T2rNZ2wQ
         iVBjKUdx+PILMb2a+si3i5twjlDqYZh+4Rtr5Ppvn4+SNzTFx4FpddTZdKRR+Pjf4L5O
         rS9gjumquCldzJrMm1IgtCkaGBvv00cPvtPvBSyN6Qzfe0hM91VqOZJ+Gij4GG3G/vAB
         zzrARogFYM8YTFH1SERvCwdnNw8aiVEsmPikRY1Y301u6s9IaBWrWJquqc6nXZdFKWQl
         JbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787525585; x=1788130385;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF/nKW6BzduyHSxJj4+7z+12HQgDeEpMqu/UQzO/8HU=;
        b=l6jRyQeJRX6WwJknDVX131YcbnAOgI0K+47nMJkrba7OMhBDwx8tK3vTPbPzPh7akc
         dRzBIr+HN2O7S2HUX/U8FYHvBdk/n10caHIpgtSc8dKdBnzPJ5uS0J47S7MAAxPGQaj8
         nNbEixSJacXnCf70jcb5TL/H+Y8iA2BZeOQDgem5SGFmbW4Jd1VnzEDg7ndZYq/BoOZD
         raIfY1iOsuIK7O2S+lVp3KMKGGJKHBrlNnNnDDS+t2+Jh74c/mhLMydPQDpqX5nUizli
         GNB1gAusB+Hc62CRpOeeFMtB9fsh9RXkdntlF79juNMOWg+3K8OaQdlM65SRHkCyhCLH
         E4Mw==
X-Forwarded-Encrypted: i=1; AHgh+RqlHbWeCkADKJ2t/PzFpvpLt+VuwITHD/cQn1RpXdTho+Rdhvrvk+yo6ta1xAK8NRoqYqKhchloACdGjVSm4Go=@vger.kernel.org
X-Gm-Message-State: AFuF++maAmk7cyRcLcs9kI62Iy0r/fPRWtwZJ534hmKje/yHrHQHk/QS
	wYB/ET8SMmKvHxD22CJu8NFWdtwhszY7dY3z30QGhJEciGK6ftr9Zwib
X-Gm-Gg: AR+sD12DumniFmkezb7h0cahx2FjimRClzkpT0V6XVi0to7SWdvw0hR5I81CBAgruiQ
	hRHg6UEDk8YU6W+mM31fBB5U0SZSESY9t8QVSa3KeKISiqkl19RRD3bIITLDysNREYS95Bxm7ii
	zEzNLtmX+AGY3S5xYUncxB8PwkahClQgsRro3e3sBQKTxIOPjgi64/khb7l71vRoWlvis+5FoiK
	CGmlrK85twxs7wFHOiMRPOQg44ZTdzwcLXPk3MaVQvX7lcgcUYx0feb5j2dHRRQC5qoU4D6sGP6
	GKj+lvWNpvYmdDwdZwPFvC6/72fipMtx4/QActqkBRdTqvW5ztp2JyzykX19kMhyfoq9vF9qFb8
	bpqAcrjvKwVKBR7PrMaOe8ctaUD7OlNhMHNi9wRuh/1x3urI5YZF0Itys1sgSSTs902UGh0mG0m
	GMoulqIGQDzs2mQSE9P+MsUrhv6AuFp6ju5BzCvHB4nFPnELohYmMzyPNrfGnruFtUE3rGmuK9Z
	TgtoM01Gg1sibT/a3zSFJCvL3ItvH5aJkoXZC7NaFK17jSQU+nhGtmOoV1Gq1VO+CmC4X0MDhbt
	1MgZQ6CSmJeUIs+Zb5NmYZWxxjI=
X-Received: by 2002:a17:907:3c83:b0:c21:7584:fc58 with SMTP id a640c23a62f3a-c246a60cd41mr2448670466b.12.1787525585255;
        Sun, 23 Aug 2026 15:53:05 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64f6sm978414766b.40.2026.08.23.15.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 15:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 00:53:03 +0200
Message-Id: <DKWOXOPN11A1.1BNV5J6RJ7MGJ@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v7 9/9] selftests/bpf: add tests to validate
 KASAN on JIT programs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Yafang Shao" <laoar.shao@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
 <20260822-kasan-v7-9-99afee6ef7fd@bootlin.com>
 <DKWONS3UI84A.382GORI5CXC51@gmail.com>
In-Reply-To: <DKWONS3UI84A.382GORI5CXC51@gmail.com>

On Mon Aug 24, 2026 at 12:40 AM CEST, Kumar Kartikeya Dwivedi wrote:
> On Sat Aug 22, 2026 at 12:39 AM CEST, Alexis Lothor=C3=A9 (eBPF Foundatio=
n) wrote:
>> Add a basic KASAN test runner that loads and test-run programs that can
>> trigger memory management bugs. The test captures kernel logs and ensure
>> that the expected KASAN splat is emitted by searching for the
>> corresponding first lines in the report, hence validated that the needed
>> instrumentation has been inserted by the JIT compiler before the
>> relevant memory accesses. To allow each test to trigger the expected
>> report, the kernel must run with the kasan_multi_shot configuration.
>>
>> The runner covers different cases and settings: in the nominal case, it
>> validates kasan reports on basic instructions (on all supported accesses
>> sizes) but also when report _should not_ be emitted (eg: for accesses on
>> program stack). The runner also comes with a few specialized tests that
>> are then not executed for all sizes/locations:
>> - specific atomic ops
>> - test for instructions involving different verifier states, with some
>>   states flagging memory as stack, and other states as non-stack memory
>> - tests that validate the stack marking shifting when a patch is emitted
>>   by the verifier (zext/rnd_hi32, constant blindind).
>> Most of those tests are able to trigger kasan reports by altering the
>> shadow memory (triggering faulty accesses is otherwise complex, because
>> of the verifier). A few tests trigger actual faulty accesses (eg
>> out-of-bound accesses)
>>
>> A few of those tests depends on cpuv4 (load_acquire and store_release).
>>
>>   # ./test_progs -a kasan
>>   #171/1   kasan/st_1_not_on_stack:OK
>>   #171/2   kasan/st_1_on_stack:OK
>>   #171/3   kasan/st_2_not_on_stack:OK
>>   #171/4   kasan/st_2_on_stack:OK
>>   #171/5   kasan/st_4_not_on_stack:OK
>>   #171/6   kasan/st_4_on_stack:OK
>>   #171/7   kasan/st_8_not_on_stack:OK
>>   #171/8   kasan/st_8_on_stack:OK
>>   #171/9   kasan/stx_1_not_on_stack:OK
>>   #171/10  kasan/stx_1_on_stack:OK
>>   #171/11  kasan/stx_2_not_on_stack:OK
>>   #171/12  kasan/stx_2_on_stack:OK
>>   #171/13  kasan/stx_4_not_on_stack:OK
>>   #171/14  kasan/stx_4_on_stack:OK
>>   #171/15  kasan/stx_8_not_on_stack:OK
>>   #171/16  kasan/stx_8_on_stack:OK
>>   #171/17  kasan/ldx_1_not_on_stack:OK
>>   #171/18  kasan/ldx_1_on_stack:OK
>>   #171/19  kasan/ldx_2_not_on_stack:OK
>>   #171/20  kasan/ldx_2_on_stack:OK
>>   #171/21  kasan/ldx_4_not_on_stack:OK
>>   #171/22  kasan/ldx_4_on_stack:OK
>>   #171/23  kasan/ldx_8_not_on_stack:OK
>>   #171/24  kasan/ldx_8_on_stack:OK
>>   #171/25  kasan/simple_atomic_4_not_on_stack:OK
>>   #171/26  kasan/simple_atomic_4_on_stack:OK
>>   #171/27  kasan/simple_atomic_8_not_on_stack:OK
>>   #171/28  kasan/simple_atomic_8_on_stack:OK
>>   #171/29  kasan/simple_atomic_fetch:OK
>>   #171/30  kasan/simple_atomic_fetch:OK
>>   #171/31  kasan/load_acquire_1_not_on_stack:SKIP
>>   #171/32  kasan/load_acquire_1_on_stack:SKIP
>>   #171/33  kasan/load_acquire_2_not_on_stack:SKIP
>>   #171/34  kasan/load_acquire_2_on_stack:SKIP
>>   #171/35  kasan/load_acquire_4_not_on_stack:SKIP
>>   #171/36  kasan/load_acquire_4_on_stack:SKIP
>>   #171/37  kasan/load_acquire_8_not_on_stack:SKIP
>>   #171/38  kasan/load_acquire_8_on_stack:SKIP
>>   #171/39  kasan/store_release_1_not_on_stack:SKIP
>>   #171/40  kasan/store_release_1_on_stack:SKIP
>>   #171/41  kasan/store_release_2_not_on_stack:SKIP
>>   #171/42  kasan/store_release_2_on_stack:SKIP
>>   #171/43  kasan/store_release_4_not_on_stack:SKIP
>>   #171/44  kasan/store_release_4_on_stack:SKIP
>>   #171/45  kasan/store_release_8_not_on_stack:SKIP
>>   #171/46  kasan/store_release_8_on_stack:SKIP
>>   #171/47  kasan/ldx_patched:OK
>>   #171/48  kasan/ldx_patched:OK
>>   #171/49  kasan/verifier_paths_stack_and_non_stack:OK
>>   #171/50  kasan/ldx_oob_1_not_on_stack:OK
>>   #171/51  kasan/ldx_oob_2_not_on_stack:OK
>>   #171/52  kasan/ldx_oob_4_not_on_stack:OK
>>   #171/53  kasan/ldx_oob_8_not_on_stack:OK
>>   #171/54  kasan/st_blinded:OK
>>   #171     kasan:OK (SKIP: 16/54)
>>   Summary: 1/38 PASSED, 16 SKIPPED, 0 FAILED
>>
>> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boo=
tlin.com>
>> ---
>
> 1. Should this test be made serial to make sure bpf_jit_harden sysctl cha=
nge
> doesn't affect other tests?
> 2. Clang currently collapses the intended ST/STX distinction for *_on_sta=
ck
> tests: default/v3 emits STX for both pairs, cpuv4 emits ST for both, and =
the
> default st_blinded object is already STX and therefore is not blinded. Pl=
ease
> check and assert that xlated insns are correct in the test itself if poss=
ible.
> It might be necessary to use asm volatile assembly blocks in case you can=
not
> work around the compiler in C.

For 2, I guess as a whole you still get coverage, since we run with both cp=
u
versions in CI. So it should be fine I guess, for the blinded case too, but
perhaps it would still make sense and be clearer to verify and only enable =
st
case for v4, and force stx to remain stx on v4.

