Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753067;
	b=W+fMosA6FDbMMnt+Q4mKHW3TRSCe2XxupmFME7R7eR7X4+xxLO7ZYr/+aui6vFismmUl
	 p2MoNmFsviLrKpoptjVzEXN+4fYvZG/PhbJ5mxaVMPKWTqXv5AtAk7kFdE31zNG85gLaU
	 GYaOlK91F8TaVMVqXyL80xTqZBIdwrLGCeFqf/lNJ0PhcgxlE1681PI3A5KdEi6RA0r+Y
	 jrYpZGUMYKHo92wd0agwOZvLSWubXoIC6/BXnGm1vXnk/d1v0Ctc1BcNT7LQTXC3ONH4z
	 W6AAmF3pYNMmm2iimQByRt2mutQt5OUs54UdjCKjJFAuhM9uJNss2ckLZnd+skDOZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=EXDY9w4RlOwbfIpRjyMCCd2SiyWv43JxMOCKrc3iaW8=;
	b=Oqx2SkUKtoSfhg+dlnu54s/o97q4a0Wo5q3I81WUI8SaPTTJZrAyFT942wUC3tb36/mJ
	 URfoL5XkVoMUiu3uuaz1kvi9FITvhgJkNeuuzXQclsyxYMYVyh24Nz4ZHrq/YxPOLJ+m5
	 viG/GtYCySPVBQ3f8+75nLkgd/EqvX/L54Oq+WXHYK+ho9X3uQtwH8kZniACTYsilK/NH
	 rdJQUhzrAJk0Jm5fz3bMaK959weNeVy2Kq8Mxx6EkmSFUxZMtF7j4yOplgbyAEXNR7XMl
	 XyTLBtohkL4iGiasOW8niclr4eFbylkyKPOlQMGONaf3Rzu6O3xvJQ15LaadO61JnkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngl98GbZ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E63606A324
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 00:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E63606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngl98GbZ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso150307a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753066; x=1794357866; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXDY9w4RlOwbfIpRjyMCCd2SiyWv43JxMOCKrc3iaW8=;
        b=Ngl98GbZWvNp9KhithH0kX4jd3+dZnpMCeIFB+t85NCm271/mMF0fbRM4Mdf1r79jD
         g1AW9F15+84oH2lsdNfLTHD+JPME6Zp/9cO6z2r3QYVx1uoPF5jCSXmstXi7P+zxfVJk
         hWVOnUb2UIPIHAZL9unt2/Fnlw9PB2pgXeyKggwdtCsqHKyKIgKMmhpE06+Q4xzHzG3V
         YOPj/VPOWjkcfQPxAjEnJltGIDXPYrdzgLIRm5598V1Ur3yE7xZRQqFAbtajb+0L2vTD
         JUtGD6RO401EaI7b8ed08LEGDXgy+ms8UzAMBzxC+xFu0OhMvTqEVxbGGUJE8yVuHR0s
         zutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753066; x=1794357866;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXDY9w4RlOwbfIpRjyMCCd2SiyWv43JxMOCKrc3iaW8=;
        b=qyFShTfOi8yKs1m065k8Aa3cwytGJEuxVLg8XjHg5wetbWbiYVdukf4HQEjvcseenN
         JcmZ9oR8SORpTUTpeBWC6ANyQm5ZSWZJgb/GSPIm/vyNAA1b/WLwPpJmX7M5mfOXgkFn
         JNKoEjEQxPQbSZmjwcOMHxU6iipnM4vb4ejWgmLxFpWvilozIPktZz9raMUVo9w0Ntlq
         T+PGNwLH+reUUrttWu8rJEvI68dBFEEOUbs6RN/zU6OxVh+r0otFZ6lkW/VKiRHsb6oq
         2DTWPpWBp5/8F+zlFHyiF6L0nOyjWaKG8k3fSd/1WWGYtsNYPDB9VhBV4EDAzEGEf3N+
         EB6w==
X-Forwarded-Encrypted: i=1; AKwUvBwG/lz8WlKM6AEiHj7DmkCgDYClJwORYFcgcOl//PguwAjroRCuiaO/7kfB8ao7QIpANSnl4D+mnhaV3YymgiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82v8pwnROhabPBYbMkVdXV6wecnZNrssbzCkLX4/YqLS8L/RwB
	T5JVn3i5NV366/GpRiX8nAwG4PaTn3OnagjxeqKh5zQUCFHHeO5EWrrP
X-Gm-Gg: AYBFou13XfSGlSiQdkvE0lEVdEajTfxMf6X1mgDCBgDTtwseAN1m82LOuTSUG/heOZE
	CO/R4dzjLqnyCRuTf1XGHuDRHwaN01VZF9y7DnuVjQIzr+hnNG6dPr3ZOM+V5GfAVf8mo4H7oUH
	M6hT7xVl6pqYOdjXLjvTGNYwXPsBNa4wHG0SkQWj8EOA5A2UUEFM/LnIEYAVgbUlhnzmw0E9WV3
	ygfnPWDleN8DwNGg0mikhIJw02MtFVRDmIbB/djGfcUrrrZV0eyHH2IJVDyLRaB5xPARr0bAvs5
	dHPZjjvGOq3qSNMCw+WJEzw/xyxIaANqucwtrmoloLhQ6QJTyDveGtS8YwSDBjgXEyIc4vRJYal
	B9KcZLwvP+lEhjA8Sa2aqL7FP8FKKyVLSaryEu/jPR93QYcCTlFpS+NkU6vjTUCWf8NR+Nl0t6i
	H2VangS/fO4hNcEwaaHEsX+xzYy1ui0/ILyW+dUjEgxCLfCVBB8AzP4lxUeE33llPBTdpESLqhV
	A6faiXEyuhvAXpd/HJx3OPtpy5U3PLFo2cEd25H500fK8N6jlShRpiebCEjXdQcBy0A5ujxf0rD
	pE+qgN0vOBBLHW2Cosjsn5NMCmNCoB20nqYeh+MAj+KmyGp1TDPo3iqWsIEFHpfnBquRmpWM9eO
	Bua/l+4QhD1kfvqGlwzx0TB7vugDXp48vO1c=
X-Received: by 2002:a17:90b:1845:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3ae89787ea2mr10693463a91.46.1793753066335;
        Tue, 03 Nov 2026 16:44:26 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d572e7sm567255a91.1.2026.11.03.16.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:44:25 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 00:44:25 +0000
Message-Id: <DMM0E6AA3KB6.28SYB9X6ZYIHL@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Account for zero extensions in
 patch list expectations
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <iii@linux.ibm.com>, <bjorn@kernel.org>,
 <pulehui@huawei.com>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20261103215309.19950-1-dennylin0707@gmail.com>
References: <20261103215309.19950-1-dennylin0707@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 01:53 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
> patch_list_insert_in_front() checks the translated instructions around
> the call of an inlined bpf_loop() and its callback. On s390, the verifier
> adds zero extensions after the two 32-bit register writes in the loop.

Thanks a bunch. Applied.

But could you follow up to
remove the two 32-bit writes from inline_bpf_loop().
'w7 = 0' and 'r7 = 0' do the same thing.
'w0 = -E2BIG' is an old bug. bpf_loop() returns long.
The helper returns 0xfffffffffffffff9.
The inlined code returns 0xfffffff9.
So 'long ret = bpf_loop(...); if (ret < 0)' misses the error.
The "over max limit" check in prog_tests/bpf_loop.c doesn't see it.
The prog keeps the result in an int.

No other insn of this prog writes 32 bits.
With 64-bit writes the xlated code is the same on all five archs.
Then no need for the #if and the second copy of the expectations.

Something like this (compile tested only):

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 6b719a2..321624a 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2783,7 +2783,7 @@ static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
 	 * expected number of iterations is too big.
 	 */
 	insn_buf[cnt++] = BPF_JMP_IMM(BPF_JLE, BPF_REG_1, BPF_MAX_LOOPS, 2);
-	insn_buf[cnt++] = BPF_MOV32_IMM(BPF_REG_0, -E2BIG);
+	insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -E2BIG);
 	insn_buf[cnt++] = BPF_JMP_IMM(BPF_JA, 0, 0, 16);
 	/* spill R6, R7, R8 to use these as loop vars */
 	insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_6, r6_offset);
@@ -2791,7 +2791,7 @@ static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
 	insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_8, r8_offset);
 	/* initialize loop vars */
 	insn_buf[cnt++] = BPF_MOV64_REG(reg_loop_max, BPF_REG_1);
-	insn_buf[cnt++] = BPF_MOV32_IMM(reg_loop_cnt, 0);
+	insn_buf[cnt++] = BPF_MOV64_IMM(reg_loop_cnt, 0);
 	insn_buf[cnt++] = BPF_MOV64_REG(reg_loop_ctx, BPF_REG_3);
 	/* loop header,
 	 * if reg_loop_cnt >= reg_loop_max skip the loop body

