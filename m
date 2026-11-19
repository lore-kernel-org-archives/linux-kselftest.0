Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052985;
	b=IWWHZkhgGHthYCWtbnmnwTMhiZ7+HDuSVbq8iBg22SQOhl8Ab6alONXASaYwjwRRRnIa
	 ki4daRV5YHI642RoV8YuTVtgAGF5vqyifZybPsRh+xZTzhT4oSUfxmmUaqRbmMVjYFlQU
	 AgBl9YCda8B9+sVY4bUvxiHMBw6M1YLZolTBX3XcXce2CkaTmYOQyY+LVUeOSEUqG9bAS
	 rF53yXnZQrgN5d6Eb4w1vtxNxGFCF7I4q8tK7wufUEH/znO6Bc9HsnlUCIA9GON+D9I1C
	 CGMa7LxoaZogIc46YZFSQAlvMHWgEwC4TVzeK+gRbCD9fNWZ+mtSv6JRBK5DAn4OUbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=aiglJxDqvtN3JZZazny7hBMc8RmhFlbOGLZo5lpc8JU=;
	b=RuQyT55bGU2m/4zjJvoJd/1d1e7gjSenUwdDfKI/tP/EDgmhF33pkmpdVRKzvmFZoKsn
	 YE4D76qMvy7qtlz/i/82c2LFZLENOFnCcmbhGU3pG63DkNc+lGKdrSARvbUGbF0hIH4+Q
	 sHb4kmHQwlyxietamQgbLdtHZfS0gRvzCCuotpJx0q8wsdteuh4Vzxq8EZpzPiVgY5/5f
	 R25HF8cdSE669VcVR2LGunwOTg4APaW3pfWybSrfQcFjk3Qa9fscDXJlWyUE8tO1dVLNx
	 HOKQgd1Z8lCy6mqh100nqSC0cfUtSqlSIcbjP6SZd5ZYeMaV5OxPCBsjnNDOC7osOBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkiu6mw9;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D2606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 501D2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkiu6mw9
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b904d10882so737653b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052985; x=1795657785; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aiglJxDqvtN3JZZazny7hBMc8RmhFlbOGLZo5lpc8JU=;
        b=vkiu6mw9bHVOs37FCJLumqFwCBMUFudfxWFKeBHS6X6Dyz6H5ynzoOVFfqe8Xt1Y0j
         P42Ia4rK/NnOtIsF/aNmriOf3tGhPIymHDUquSIex7eO8X8CfNXTYbF6I0vbohKRiP61
         emfv+1tHk9xvYlzvDeeSlLHFUEaO66flClBplwx88Y1CRuFUnYcK+TKNi/Lhd8GN17wQ
         DObXZfXz4qK6KcVg8aHLfxktgP9dr0Av3paXsq4VFjriLhg0ZSMS4TmSMnZfhtwy43+z
         0en+kQK1el1wSIzXfeKFloxq7PEN2FocAZ0E5QTGCq6wn4qTcNMt272rZvsaOAK4tdKp
         LyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052985; x=1795657785;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiglJxDqvtN3JZZazny7hBMc8RmhFlbOGLZo5lpc8JU=;
        b=auyPzAMaCBCZOrEUaZhorCpqPvlL4U55CLlrM9+1DvFiAZAfW2Fmog87w2ILNWJduS
         6JMOFijqlWyzuxphjJpIvRE/J3v8/62MVEyDOqy9yKEveDAz82rJ8FgiztmLNpCy/NND
         7i7ef0tsD8oe6dRw31tbxMfbS8AnMHeRcJZJXi9kHQq+2R3qeJY2QGyack9GTeIahO+j
         S3rI13eZ+VsmkvwS8T7RzkLhaNDCtSSfn+KjQ4ZVWZcfbAzTXGfARDUSP+SfiNCTS4Y3
         cZebxY6Ov4EjRgr4MOY609hLTVUHL2k5JBUWofHHFW1NbSPFBV4rp3odcwcwqTlzqCWS
         qM4w==
X-Forwarded-Encrypted: i=1; AL+hErGwQxx/82GX2WBKjxDTVOePDvMRSyxMFe6gt6h7uUiWCoIDlJnyH9MtwtO41h4ZFvOqqoIlhBgNlzX45ud9C5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KROIhoq0EJQqfYVyhSr4jXmtbWrmL9HVyPlFB289anZNWyuF8
	ED3Z+wLfN3SqJjzqabmyM4JTv3kenm92jFEs4GVqfl5NNZKtYn7ejRYn
X-Gm-Gg: AYBFou3ty+MLL4R1TMW9EA8Uo0lE06ZhmrpHJuWMUbDmA0xRkH7z8nhyHMtZhiaSf5k
	YI7iwfGU7ubOcNFaAP4l87NXwfwID7i1isfDrZfbiPGXbQ9AlZ9g1HAxSTLmboBug47ov+dPe4g
	MKBqnZncvie2tWKsnhf5C6PbMIETwQiO71MZ/yVL8v+NS+b/CY4QuMygjK1agaBPJ0oYAcDDLTD
	AbvM1zltz4dFrFqhGkyK+7bm6cg4ThTjm9on58J7Eq+RUcwHDdsfHJyxmafwBBGWsynjJJIL7Yb
	eWX1qN5DY2AavMIjuA7b0gDRBOAIgHyZoPN5D56nVrXHk1ng9QWCbMn693zJ9gJGXjpQVzLaCrq
	gK6lRD5r+ZfPqujzdZTkYm4kVVojmLx2sRR94JnQl9OsLM1UyUuCrWUlIxoJaG/KO8cYY71If95
	2u0evGMV+ShDh2r3XsBBUNY1hlSbBbm5uN/5EbBwWopXrih+Mgne+0G/0g7pM3WqrKLEmGxKAwX
	RRRB5zVPmfN8YlzyEmajkNkyLV0yAOQ9C8A6aABMDOeVeRz31gqUEmHgxPMBdKTsRdlVU8k/qo5
	UktDt9RrcJ9W4F+yZ+kWa9fiCkazbL1g/IJIglYi6GoW0OCk504RmN/QSQomLz+lPbwZUEmF0Pd
	cM2IdSjxfiVvkqjaBdqArMQkOXpZJPtMTxlOcGO6bB19iCkxgHU8H+Ok=
X-Received: by 2002:a05:6a21:2d43:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3fe86ecfa2dmr4525393637.9.1795052984493;
        Wed, 18 Nov 2026 17:49:44 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa769sm1951632b3a.18.2026.11.18.17.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:49:44 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:49:43 +0000
Message-Id: <DMYT6CELPKLL.3IH95CNKKXFUP@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Run all summarization freplace
 cases
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yun Lu" <luyun_611@163.com>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <daniel@iogearbox.net>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <shuah@kernel.org>
In-Reply-To: <20261118073309.125424-1-luyun_611@163.com>
References: <20261118073309.125424-1-luyun_611@163.com>
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

On Tue, Nov 17, 2026 at 11:33 PM Yun Lu <luyun_611@163.com> wrote:
> derive the group count from mains. This restores four packet-data
> cases and enables four sleepable-program cases.

The four sleepable cases will fail on arm64 and s390x.
Their targets have no __arg_ctx:

  int main_might_sleep(struct pt_regs *ctx)
  int main_does_not_sleep(struct pt_regs *ctx)

pw-bot: cr
