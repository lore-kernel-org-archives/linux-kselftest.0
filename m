Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9341D643
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107002; cv=none; b=WpYyg3i5zTR4Mta2LVclrnW3ih9iHUH7cXWMLBdoVHsAmj4l8EyJSL+JDW4iEOukrjZf8VuMG3HvQuvKx7/llqdFXI3PDwCRX9wd269wL6TKmcQwYSCO+FwHQc992brl59zojOznpthj0NJNT2iRIICmxSRUcX42pmpN98n/isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107002; c=relaxed/simple;
	bh=j9GQJQzKvcMR+VCSiLR4VIzU/cQ+59f4K6xs5L/YzoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+IyPC2j5sty1N+OjJZqN7flPVGvDOvsz6uK4STo4nw1Zy60fQrwM4747XK9DmH59/I77ge8TxUoUgnrh9k6JMwk1NEvvl+hocj8WCoe8Ho6oyVCWA6H8s0Sx3hQpojDcEl6/BnQgZ/V1O2DjZj9JgkZhct6Z0i8w6bkZGpW2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eyJ0F88i; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eyJ0F88i"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15ea93028dso566584966b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 02:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784106994; x=1784711794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1ZmhCboRG80lxcYaF433cPODXSJBxTB3W4f2Wh3+4c=;
        b=eyJ0F88ipHm7mrBSfZk5sbVGtLSJL61gfqM4lmBMfcwfbHgCK+2o0CQumTSsH7jCG2
         MhIAXtEF1t6+E0MGfjVdNOBIoSjqjqBbr3p7ZngEHg6h01XrhWlXLlvtypxmKnOdJaDm
         FUDgM08QDUiGzMuSgsg1Rh6vjTpFRmlfzmsyKSXA3mM9skH1ytlWXREnI5pX2KJ1xK2A
         baSMJRgxUenAH1cqQF+ltlf1m25ideXr1y6U2GwDutvv/u5Z3aUvEPxBkXL1W8qr4zCd
         yYNbqLuaFYOPLSd2r9hHyzp0c3NvIeiW8pZUpDN0saakUlW+FNHUC7QVVNGf/Xi0CoP2
         OtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106994; x=1784711794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A1ZmhCboRG80lxcYaF433cPODXSJBxTB3W4f2Wh3+4c=;
        b=DeuCvD+Vsaavf5GbeNVbCEpM+0Lvyb5T66Y5Phs8ZdIQbtAZUSwNJqcXZZhohwCYDK
         DxZKHHvU9zzmq+iYcZqp4Je1At+966MW0OD+v18YpW2HW6O2Pt9cQoSzm6Oi9jDATFXV
         5PgSp8sy1wBmk/S8gGC9Z7+QBzMnsZ8M7CplUgdS3p+aIy9eKJS+xUXT86k5PptXpuf9
         TCzuPN76UlV98jHnAikEo5Z09R7G3Gxn5jHqkTR78q2UKLNYdX7rMj+0CHBqKVe7ggck
         zcFpaC9OyUk/XFGOZ8mzZ0OToEkKFKDtOOhd6avyvRFy66SKyUjRFs1j5jrWCW2xQTEj
         0oug==
X-Forwarded-Encrypted: i=1; AHgh+Rouj+HcumLFRGwsAXphmaKQC7HKUWqeXLDmiFUOxlwtMWqiW8pS81ha2xDtyxPc/wkoxDOoGu/js8SFxCuzeMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56aEp0fZv0aMG0ET+7UKFCL5Faj1gcBhKFo+YEtgkjsOJwc+5
	mOWPGvpt62qIjYzJJXZ2KRrO/zkkU+hIQrheuLoNsHxFOKyoog2Qe1Ww05NtAg8ro44=
X-Gm-Gg: AfdE7clCku4i1XWHzn2HahYCI1ep2ecMFDGR4sCXdAPfQWCnXQ4vitlPxlCy58IWY1e
	JwZpd7kdRpoMW+wcl6YqewPp5uPAIfNIOL+GXxPp6KiSLWIjubYZcMfIPrQEC/aeHJbtKrcR4hY
	tJcegODQuObzn/Q06z9/7kNhzjg0MrOYRotcAb9Ffr2joPFFWEp9PzACqCFfqSyCMNAK1E6AnwA
	rd7xakrYxyxV62xaslYS01/JMnsA36PYJMQlPGmlvDNj/t2erUmAexflnl0xG0rPzG3qiSxuasi
	MXh5p5pHovPg2Z29/ZgKbCBbmgYcb+YRkSubvtzcNNTnSZBVuLTWhFJx7bgv3oeNsjAytYAPXlV
	Y4rPDvYISXNTwnm66iqOOhBmawIRKMkOc+c+8JUKRgnBdp9Oh6gBFuxh3vE1AHwGsXinhfoQL64
	FweSedDJT7Ltv5OGDOpjlurFyymqWXWq4h
X-Received: by 2002:a17:906:9c8d:b0:c16:579f:f7e2 with SMTP id a640c23a62f3a-c1667c58e81mr324023266b.64.1784106994203;
        Wed, 15 Jul 2026 02:16:34 -0700 (PDT)
Received: from u94a (27-51-89-168.adsl.fetnet.net. [27.51.89.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3c99fsm130888425ad.68.2026.07.15.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:16:32 -0700 (PDT)
Date: Wed, 15 Jul 2026 17:16:17 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: sun jian <sun.jian.kdev@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Matt Mullins <mmullins@mmlx.us>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH bpf v5 2/2] selftests/bpf: Cover negative buffer pointer
 offsets
Message-ID: <aldPkgqkV9yq9OFf@u94a>
References: <20260714093846.18159-1-sun.jian.kdev@gmail.com>
 <20260714093846.18159-3-sun.jian.kdev@gmail.com>
 <alcGgfNM94zgydlK@u94a>
 <alcKV2MXI_5dsaez@u94a>
 <CABFUUZFsJsF-C5Z2gb3FkZ7WD=vBavnGdZ7veScP_+dwZLsaMg@mail.gmail.com>
 <488c235db713648bb2f5c90e4389c96a97ebcdde.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <488c235db713648bb2f5c90e4389c96a97ebcdde.camel@gmail.com>

On Wed, Jul 15, 2026 at 01:54:37AM -0700, Eduard Zingerman wrote:
> On Wed, 2026-07-15 at 13:26 +0800, sun jian wrote:
> > > Anyway, still recommend adding a regression test that test access to one
> > > byte before the start of writable context.
> > 
> > The new tracepoint_writable_reject_negative_const_offset verifier case
> > already covers an access before the start of the writable context:
> > 
> >     r6 = *(u64 *)(r1 + 0);
> >     r6 += -8;
> >     r0 = *(u64 *)(r6 + 0);
> > 
> > Its effective access range is [-8, 0), so it is rejected at load time.
> > This is the direct regression test for the negative-start case.
> 
> The existing test seem to be sufficient, why would it matter is at
> offset -8 or -1 given that the read is appropriately sized?

Right it doesn't. Let's just, pretend I haven't suggest that.

[...]
