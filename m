Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B2489FBF
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941169; cv=none; b=Z99pZK+GZzAHCCYr7XiOtLmPYHvYxJqTmRSDEEKOfA5i2plYebcAsqoAFy74ayX70JSnTVW7ussC6y3xtxU4QFtwaS8x4B+w8Gu/vRs7fbbnBoic3LEMsDQMWlkUIsCOustbdWjncobeqIQM0kPQitjuSDxMCL1SNcEA1FnvhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941169; c=relaxed/simple;
	bh=Ev1N1gc/lPc5jNTnXcyH2a+Fgv/qSRx7c/in2/QcUfg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=uyA+j+YCJFZzOu/z+aOayhyvD5gtDKUvCQ9Tt112cze/vaaJRTdxHbCCv0Hbe9rp7MSoaB5V/T/zxOrBg8FLZS7pG+MMHrezvnGsdWEVcqS06jJ2cY68nvELNoqKoHw+oRDc2no1mC0lLMlQNvMYrr/4e11tnaESEasnIHXMIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAJBoY1s; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAJBoY1s"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso3960317a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941167; x=1791545967; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8eATBOK+fGnHSCDRa/FUOxqb8y1u4ArDefdKZmCanA=;
        b=WAJBoY1sllEh3zZduW7NzMzW0d8IHHeFKlnnhU1QXRYvMLgSk9c7XCjbA+XN2+d7YS
         o6NcdjiaENnBDhV2A5zGkA4T4+Oi1FCob6+riwbzCB54jLCfh+InnTdSBoxz2dtjoJrC
         lfpYThFzPpYa+8esZnNo/WvND63CtyqiCS2za3JXsb5jgnr74qMwU/kbLF+/op2G2Wrf
         sflFsBKT3IDi29IMG3aPNu2xTqweEgOlLU1y0B881wvZPUdO6/rgr9NBi9gvO03x0lXJ
         n3jmNJZmmmSqurMCb/Sqyy9iOPs91wVTHxCIsGL7NFD9HGiZkNttRzVMxa5eUfB8l/9o
         iCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941167; x=1791545967;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8eATBOK+fGnHSCDRa/FUOxqb8y1u4ArDefdKZmCanA=;
        b=Rg37nb5CTD29LbM6yiFo7REK9SahYAWzoRTbU9lTMMRCdUQrENhkK+7TOzkNOYsdgJ
         S07RTASsHQ2s+tIJvmfOsEfZlymZqead1bjXApOfGUxysI0UUHniUfvpPd+nYB8g7R3V
         VZhaN0X8mv/ChP2VUmbA/fq7jryEHd9bYqCopdn6cuQbcbRWQxUW6qcNOkPU0KRnzpep
         B10ZdObMJJrM0a9SV07keEGraxEmlH54/rPhegvfUgqQu/VziDwOm0xto3QozaMOM7+U
         zOjBop2I5MkPwq6/U3KNiUO0DRzd1lxp3WrsgEOCTnav+LAW2RPm6mR1UwVMrlsGfqY5
         nvAw==
X-Forwarded-Encrypted: i=1; AKwUvBzt6Wy7feRoW942/LwIhhS1ECYeiL0wcnLkmhhQc6Lm/jFsjjmxEwVGqHDxnjoGUmFpcA+pUkgcunxtqoIOQo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUViLm4nF/Up4nKaij2nDWkPh8Diu97+9Ps/YxTeMEF0eMOMuB
	hMxAP9ColjaCtoUGH6OOKxHV3LLEJrZ6QkoxO2ChBrnE0r9/CvUrToz+
X-Gm-Gg: AYBFou3B5igaFXVIY5TQ3RVJvrMiL3a2RdcwAf1LzvDttkyupWyjR/vSEKOxU0nV5+K
	NZr1+qYGF7BmfrqGJiNXbvImjFAVWHAqT0BpsiQw0CTPkj3DmL6TeaTUOZXNZY8xM87LaHaBZ8x
	KF7HWrZTFnIZ9nEf3W13XI8etcO9WZ0R1fXGr4cr2ud+DgP7YjsRJOaoT/2cRy5zdky0K4PHJkt
	vvGHzpfbNspiCzWeOKXAiuqDEu6QQjz9/oSO6nBEtYbbcuHYQYc1GalguskfGFUPi5cml4QIYb2
	K99tDsfGvX/ldxc7fuNGezh3njjajGUwcPmv/WmhpvkSBoHh6+3wTm8Q/7WJCyPo90q61GquXfY
	1uStDWQLP8eoZIIncwgDmGGRWuGCNtpKgT0+uW0qNDtVEnEGAGsyFm6mXG2Mz9GEdPLme9rnR7Z
	r7WuYI7pc87oazpdbs1D43gx7w/k9Rc3kLQGW6VkMvSdg1YkO4/ibbIKwMCByH5Z62CPmt6Hkmp
	i42NzAkKtR7tlf5v72c/ZroW5Gsxqczz8TMQjOy8osjGRM8riFw+hY5bJNn40M2vRQr7/KFLmwv
	6mT6Hn23klsltw==
X-Received: by 2002:a17:90b:1a89:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3a6ce6df006mr2483776a91.12.1790941167163;
        Fri, 02 Oct 2026 04:39:27 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm1402993a91.2.2026.10.02.04.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:39:26 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:39:26 +0000
Message-Id: <DLUBNPLXRU86.358M4SOQJIGWI@gmail.com>
Subject: Re: [PATCH bpf-next 0/4] bpf: Apply the rewrites of
 bpf_do_misc_fixups() at once
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
In-Reply-To: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
References: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 05:35 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> The other passes still use bpf_patch_insn_data() and can move over to
> the list one at a time in follow-up series.

That's not going to fly.
After this series there are two implementations of the same thing.
patch_list_adj_aux() is a copy of adjust_insn_aux_data().
patch_list_adj_insn() redoes bpf_adj_branches().
The tail of bpf_patch_list_commit() redoes adjust_subprog_starts(),
bpf_adj_linfo(), adjust_insn_arrays(), bpf_adjust_func_ptrs() and
adjust_poke_descs().
__bpf_patch_insn_data() and these helpers were changed four times
in September. Every such change would have to be done twice.

Jiong's RFC converted all passes and deleted the old code in the
last patch:
https://lore.kernel.org/bpf/1562275611-31790-1-git-send-email-jiong.wang@netronome.com/
Pls do the same in one series. One-off patches can be add + commit.

>                       base      patched
>   pyperf180          0.575 s    0.458 s   -20.4%
>   pyperf600          1.491 s    1.041 s   -30.2%

That's veristat on x86.
test_progs loads pyperf with BPF_F_TEST_RND_HI32, and s390, riscv,
powerpc need zext. bpf_opt_subreg_zext_lo32_rnd_hi32() does more
patches than misc_fixups there, I think, and it has one call site.

> On a side note, the largest part of the time to load pyperf180 is the
> arg tracking analysis: analyze_subprog() takes about half of it on base,
> __arg_track_join() alone about 30%.

That's unexpected. Pls share the perf report.

pw-bot: cr
