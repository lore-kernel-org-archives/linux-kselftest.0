Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999D3BBFA4
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 22:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564175; cv=none; b=fTzMNOJDTI+WTRhPRuqz7ilfAZv1S6ACCXHAOn3Z4F+CktryuUR4hSa9ELBX/5U2sCUUKz2782qmbP17PX94i6tCpS3Vx5tQTRKxntN5GWMR8N+M0YQ3nxTofSwXeyE14H4GaY2VP7xVEBO0bcVEo+LKjVosh2LvGlYYqO1lUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564175; c=relaxed/simple;
	bh=bDkXPecrv7ZD+FnW3wIO2Ni0wOvcPxYqaM51+iZCSsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4sY9oRiLFqnKVbh0+x2Iyfo2/2lOvfLUW3i8EecDl8vba+2W2W4adWhoneQ2LyK+NCzco7Cf7TuUC/x0ltA5jEvo5uib0fnONiudYvXrow4utkdXmYpVJkidcMupGyDXba0cWprnA6I3c5555tYW/Lg3YUft5hQYdNEc9YOGPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8HaN0Cn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8HaN0Cn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842273a2c4dso2605542b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781564174; x=1782168974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVwv2TVfPysI3DzUdG8f9hUqz0gPu0HPnolOP2DEioU=;
        b=H8HaN0CncxAG7X855lzwTAVlZ9eW/ymwNWXHfB/ykA1mLhC9gSdgPLpooPuaGcLRIe
         mgZ5gIzjmQAbkK4eW+N2VqEys1k33VSnUDDMnaHBPyq889Al323Rbs6flbIPwtVm4L4F
         GQMaWagDQCU/7DHpeCqoJ2UglNCDS0oupTYbJAY3Gj7YSybYPs6rRrYmJkWyftTPnbBd
         ctF6xjNG22vmz9Atb/ENmeQvwLTf03/9FYccirRziUZ0qd07lAh4kl2SeokWDpnDpfSH
         A41QNMOsebevvBHWihskDgvL0Ja0sgz5/bskl/8RyjovfWywkXBShLXW9fOd2ALMZcST
         Idbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564174; x=1782168974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVwv2TVfPysI3DzUdG8f9hUqz0gPu0HPnolOP2DEioU=;
        b=q2rUvlAXmGHSPKSrs/WSUXS3xuaphSXD+u/T+YXxhUpnCjGbHS+k97nSR/QITt6snb
         2lCtLXGsBd065uNmgSfTyWXTYdn3Cs4bMP8y0/ur3sFmhB3Dwpeh5ZPa9Rr+zqdgMNrg
         SAHQeDYRYHg9TH6heF5ruOXy9AyW5tWy8H1p53WaP5er5SAPKsg9gM0iEWSllp+YNE15
         KVB5uta12voepeLCo6UmcgyWgPTZTmUaj3qn1kYkDlWi2TKrELbPByr+3Am9JP1JlQKp
         hSt44pokRbQ7uSAfb2lxmh08D/9mWhACZVRNi2bZJfiTJhhRTX8YVmSp/OGs/K/SLB4y
         UCtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y10FQGhEPna0zbabMCrz6+S36nJUQY6EydSC6sgW78zdcBXUlPlsER29/6xuZ5ljdSQoaxCUsa1EzxWhGvpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmM+6GCNvGJjzLZ/tmhS/Qey+oimTazQIC/9tMNl6i7aKRAQ0
	dg2zo2fFDVmH1X0GIQSbxjEPVpMg1CGgKNx8nBz77RS6jU62yYPOBbFcbTVP2VUHew==
X-Gm-Gg: Acq92OFWOKqYiYsolGAgMRBTiE94zdHRfJxI0CIaFUwDnA/yrP/ceUJrEVJ0KwvY9ON
	niU0oOULjI0DvasDADug7mMPJy+g7DqoT/Yi9rwA1sT+vH5Uea5F6VnFW3GqgLqOQf2t7UXDf7N
	/VvHILx2s4eFW1rOMXBRjo6oBVit32hHXlWKAyi/LrmSDuvxvwnNYaS319as3aBQyx2kR0PBNXt
	4XzbXM6/TPc6K0kdbyj6tIV65tByK2rPHPC6oXU8+9p1sfSyMVD3op3RBxl0uVo61D9JdxU7awa
	eW2Ta5m/+mRls0kUpOxsoJ0Dhw9oV4wPU351lY0HE77w94MrBYj4zaM5I4UuL9YBog7CYw2Cyz8
	VxnXw/l65QMlAalD4/xE5rnNHT7UihRnNaTBWt6PlgNcZBmVvCTk6eaWsyh73s9un8cmIpeqXoX
	QdrQlDeFEmz3/aBVQGju4eZlcgRIfSn+6momhn0UM1g/bZBERLBgG+Fc94kfOStA==
X-Received: by 2002:a05:6a00:3927:b0:842:6004:3fce with SMTP id d2e1a72fcca58-845155f7ba7mr756200b3a.26.1781564173161;
        Mon, 15 Jun 2026 15:56:13 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm11362003b3a.7.2026.06.15.15.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:56:12 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:56:09 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] vfio: selftests: Avoid VLAs
Message-ID: <ajCDCdoCqPIqB27h@google.com>
References: <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-0-b3798415c72a@fb.com>
 <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-2-b3798415c72a@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-2-b3798415c72a@fb.com>

On 2026-06-15 12:44 PM, Alex Mastro wrote:
> Allocate VFIO ioctl requests dynamically instead of using VLAs. GCC 11.5.0
> rejects initialized VLAs with:
> 
>   error: variable-sized object may not be initialized
> 
> The replaced stack u8 arrays also do not guarantee native struct alignment
> for the aliased pointers.
> 
> Fixes: 19faf6fd969c ("vfio: selftests: Add a helper library for VFIO selftests")
> Fixes: 20face8c75ff ("vfio: selftests: Add helper to set/override a vf_token")
> Assisted-by: Codex:gpt-5.5-high
> Reviewed-by: Vipin Sharma <vipinsh@google.com>
> Signed-off-by: Alex Mastro <amastro@fb.com>

Reviewed-by: David Matlack <dmatlack@google.com>
