Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600997;
	b=kb39bKtt6rhJAi+OnqNU43b4ptWn+oA/sUyzuTRZSbuM9ltkr36SuwV7lvvGwIc7dviC
	 wDfk95TkGis6utvI9kZow+m7jTdX4jLotjw5k8G6zYk8GYYiIAKmnRjAG26x1YUFHxhXF
	 whtQww6LeAmFa0bcwziuxF33w+mzeBqthjmz1JFND5mOLBzbq7Dt+lIXxc8lrnNy19hMW
	 NU5bjiYOC2alza3Ap+gE8fZiVdAA8zN004p+YuQmgKyBoMDvk9Nn2atm6e6n6phrRK+u1
	 wHFvOTIeckXBsCAMfOac6d7jbjDHfd0VXMW9B2RicY/rsb4WcQuZsfPTZSgIkjKE8zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=yvdKJNv8V04CuNvtL9/ky27CXMTr7ydOzimWcL7zjCc=;
	b=lJyfku3KY7tPrKb99jBcs2bJnWghGft9YV6AJLI6tA8wJ1CCM3SJ/EMz6mCW16ei7O27
	 5VwnD5VYNI2TH4viJxBNAe/9IxoLOBK9AtyZqNMRpPaCekk0LHfpJ+n2ZOnG5+Hb4fLWi
	 v0ZR86dQZ+WCwWmd3ByviwkIYeQ+QWG/7hBeCbAvw5QMT/ctej9moMxAQCWPUTYWBp4f3
	 2ANaeJDvjdxCz3qN3ioeAn2OnLE0WAaotdC88B3GAAw2Qy8A433DZf+xe92aF4KYxH6n+
	 5oUAo8H3T/rnZZTKnZKLKZ9eXHMX9UGtR9L0fXTRPELqOU5xZ5D6NqftpH3qZgiLd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggbFz86P;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C9606A330
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 447C9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggbFz86P
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so19281395e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600996; x=1795205796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvdKJNv8V04CuNvtL9/ky27CXMTr7ydOzimWcL7zjCc=;
        b=ggbFz86PZ19pd6a8yEtWjlR23GMGBo70CPaecmEpktaYZ7ejxop4ikBV5MVOgkRHMB
         VVB0Bin4edGKZ5WBgJloEF18Eft0y2T1hL9bil0mEcjQCetqmBvXjwneWo0rpK7/ly/w
         EO9QR/VTRQp9ZvlvfZUL/oxz4QPXafAQsvJnj7ahdmhRN9dwG7iX9rfW3dF6DwLP/wF2
         u7UNZkhV77CvP7IPQZ3EKgqzJTpwhWrXNjODTjkVY4sw8kDX5rFVYaemcHt082sC7zE5
         QNangEb7P+jmxxIwub/uQIm/2urZf+bEeeQbAwecFBVvsrOi1Sl5P5/+BZSPBzVnzh06
         r9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600996; x=1795205796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yvdKJNv8V04CuNvtL9/ky27CXMTr7ydOzimWcL7zjCc=;
        b=2I3n75Q+KlbMdL7t4BQ+4rN0iEVtfbYEkUgK1O572W8qCg+3CqILPwp4XAtv2OD3OR
         ly7IKcMVq995OnPYx8/TUPgSbhvjnVR7EXGhq2obpvOdo9uL92LYn+Fyr/waQjjglIlN
         5mHX4h3CmKKHFJGSkLrNwY4tXSHX+IfbGTEpchd6PzRw4La4AG0oaBHvpeyjKS5JGfTj
         hTQFRkCMgxF9vFuxdQSI9jVgAQTZLvLN8AIoAguKffFMIHZtLHF7bRNe8nIijIUFLE3N
         7tN60ZlKLko1wrD+++vQSAPbdf/w4HWjVvKIvbheN+BRwPIKJXCbmFql/jMQm9WTYNZE
         bOCg==
X-Forwarded-Encrypted: i=1; AL+hErFxssqFRVrAiTpfzx4SuUVkUvYflZfpqpFcMeNf69XBT9x8dZ/FgyVUbG4RPedRRChEHCg9YEJPI6UJV2+MZec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xSrTDTEuSlCCF+B8crbwuBtaoLKVXsK7KBiNhLMRG+nUjQtzw
	4BmOhocFBw+tHACXGz8xmBSIrnZLhbPll6Lau66YzVFNmpKqbDV4trST
X-Gm-Gg: AYBFou2GHuTaaDouUwxV7HmSrqh3/V/rvnuBWR7eZDrmK8eLFqp9lAz1sFmOJV3HGvK
	umaCPJZxgmLYuFvmKoQXnhytefj0fPqmd3bvuo8W+h1GHnkhcmq6ISgArhUEVLorwQauVOnAw1+
	CSQhEQtLdmiNDQ2dAdWLpGK3udYGfkI4+SosawJUg23HfqC7hLMWmGpecQkQJcgK7Iqoa7MQ2Ih
	FFrfFeGvD2gwpuu2FEEmBm88fkw5ZEVaG2B0Lge19OC9TLkPa9RxlVC1pyyLZiTAT9nRhyMde/X
	m/UXcb977aQ9s7j4F8YO+2X9GxH4sERHTYHrEqzX0/83KooslQVhDbWi0cCdU2mPuZhnzLkm8D9
	svY2ISRTRHGSei84G2RJyVazPEP80ta5LqDh98HuKTt3mKT5fsda74rYxXXseBn171+si+O9Fsh
	NopFNZVEUtQXYCyu2vCEWNvmYJCFux65wTEVCqqEG9NiVYcbQhEsMmHQ0vdF3CfHhXjd3SYLFNG
	uVFPD0OWki2pAbSYqaSVUYSOWNPeMcv1gGfdmxLyUhM53IrKxT8YlBAPB1gCUYwBmiVinjJpOWJ
	4TADrBDjowrY5pfMaCsi/NjMdIsK2AIc2ETgWBLYzd46oHWOM8tdWQ==
X-Received: by 2002:a05:600c:1f96:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb55a4ea81mr74860855e9.14.1794600995421;
        Fri, 13 Nov 2026 12:16:35 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm178215465e9.8.2026.11.13.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:16:35 -0800 (PST)
Date: Fri, 13 Nov 2026 21:16:33 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/4] landlock: Fix REFER in layered domains
Message-ID: <20261113.3fa14baa784d@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261113.eiChee8pohch@digikod.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.eiChee8pohch@digikod.net>

On Fri, Nov 13, 2026 at 12:24:52AM +0100, Mickaël Salaün wrote:
> On Sun, Nov 08, 2026 at 09:23:47PM +0100, Günther Noack wrote:
> > This patchset
> > =============
> > 
> > This patchset fixes the issue in three commits:
> 
> Four patches now.

Five patches now; updated :)

–Günther
