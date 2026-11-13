Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582952;
	b=WZl23XGnYGVN6oWinJU5t6DQ3Thaa/TXWWabTF4Vk2e2m93Ds5H1xPchhAfOXk/F8RtX
	 /vJaIhvh+JzY6GF6Veyf497VBshT0/dTmapIkdF1XyW89crrQ+llLwa2911s3wxM3on2D
	 8JUYkbC9ea0LEqhXbP11vq0af+3PtZnc2hSxqz22DpSsCPQae+0bVVqyEGsL0XP3yo9fM
	 ElQxGErf4wxTlYq64u4O3XU3v02tT3KQuVrd1N6mX88l0G0+4lhQ83hmeuBkddLDQq6el
	 /RNJy3NnTRCzkyfMRjlGKCXz1H7f25F1MLcP7+jNScyOZ+AklY2R5dTXgODYI+LWAEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=G4x9g3bqlTZt05G4xvm5t1Rd2JsR04WKB6UrLcml+cw=;
	b=mp3WfTZ6BjWGYzhs8jXNsmqRk6CmkCf1wsxkmPKEqQq+Tx2MBFIqnrpuDxdx8ODpkhzX
	 VPoKmY60hbC4vvTGA3PyDg39CyYKFuELD6mQH+2zAz+xuph+IZsJqLK89YNAgv3cvRo6h
	 UA00ppuExd8FpTyL2Ss0jJYNVcKao4fm4qercivkgP/84ijDM4oGCplst09rm5XAFMnQh
	 nLK+2l+YZ0AHoma63O71uDBs3MGQ79uabQcFIP6XOOxUq2lr8L0Wjk2NmxIGjd1iT9UkG
	 eRs96rXp2riTwznd23fATS5NnKSpGwg9+yS++GmvlMUP9yTvJJ2HuveIUZDbKeyMkhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YK37+uqO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365E606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A365E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YK37+uqO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso907918f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582950; x=1795187750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4x9g3bqlTZt05G4xvm5t1Rd2JsR04WKB6UrLcml+cw=;
        b=YK37+uqOIExWt6SEWEpNPNJi1YLCKu29di/qyfZKUEYBz3CWhdwJlkttYPW+Mq6DKn
         7UBFA3Oyo4yaCQ3V2ccqGJ9Iq7IvQk47WL45MAkOheXuvPrjmSVrupIiHS+Wufls7MpV
         ZbowRGChbGgbZxy2IHzig8u8hk30TVJldWTpCXOQQSMQghSUqwYWTmd0UIzDFfw+GgnC
         khg1U3qiQ728D03f7VfQRizVVarpVgeGXA1prFs1v3KmHF7qs4R5tieQS03B5zmh3Zkt
         no2wx1T4hf8I2NTZ9UuB5DOpqMGUSd1MI3al6D8P5o3wAdiz4MtziK64BFV76M0+HfJX
         Jbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582950; x=1795187750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G4x9g3bqlTZt05G4xvm5t1Rd2JsR04WKB6UrLcml+cw=;
        b=JA+5Ln7BCR2XnejuPwFtWQ62Y8v0xOtz96xyp8Rqb3Ye90nJqw+udxfuDmWF5LOKJL
         Y7+AlO7A98oIcmwt0LfM0Unsn9WkPoK6s7/E6ocuZKwecwy/iAmQzcYYcaUNWSDmHCzg
         PL0SCTdF1B0D61JgAfxiqX0xgBBA5ubb+iEOEHsx/2psHMhA4/tMGe2ZpcdwEiswhbH+
         3rWq7KNCszwVfWaX9vgL+4KzDMWTtn6gXDgwsVbWZZE5+qxkcZp53gSQyQ6Hy6Yyyil3
         3TP61bLcePGWKp3aOhUXtjmzzV4UW7ZilZK4QHxY6Jvq2sZHm7sIN/+eY3a6dxvlbA3X
         zE7A==
X-Forwarded-Encrypted: i=1; AL+hErGtAzIhC1vxtNwz+hDemT8j8Ja1bvvB8+mbIHo40albHT8shDrF1QNBb1nvQkzYCZpHKrSKEd5az0Hkna0Y05s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YndRNywBvUtE0RNPEevUPSAzy1HRlA05d6d2swhg7NIepJz6J
	UigDO7z0kWXlSQHNAiPL1ajHSs6TEh9ghh9XBsR6foDczFgwnI35KE2V
X-Gm-Gg: AYBFou06zN8bYYu1goLk/B5jxuMStqWHjs7voxBMQBhJAXOIpnnCfXdkSReLzNv/ZY9
	1K1DMeSRiEvSE3+yY+hBDt7Kfe/7QFIe8dEX94qiytappt4R27Tqwjbf2+6/cbl6AQVhVnI8Rgv
	IZVodVbIwltYDqR2CUmGQO109SkpHWK1z27LiOIkYXrOtDqJ5T+hN2BAfLs7aCj5Jeha5qIv6Ep
	fsgPqBzr9XwsmozbNsETVwIMj4sDsNzDFbYpNFhAu6qGpUvfLJl3+QRdVZkqrvJosGAUMuJa/Ov
	nbIM9lNCXjWyT6FO6MduAKJI2qpwEh5WDT5bBFtT75j7CIW4Mf+Dcb/U0KLVvyZfAKkIeFsfGpN
	VujNubOd3F0lU2RVBol/zUCYBQBXP6jh3G7MkYU0Qz5uTYjPX5jGB/JNnLbV6UkvZAUyTUHar3e
	/3NOzd0px3/c4pT5deATw4sgyTMulnN3zPzOV8VQdq8edAshAaxxiMOpABKlzRsAUXRzlhWdulT
	dB0aAUQqsPnSzPdGySrxJUwJLfevX6DRohDuGwVuQnq4xOvZOVTjP43LZEJDONYQqCv41gNqXGK
	XKiSgSMDioH8smTdXhGg2BTpw56VMqWqJooUTf4BrPIkyhNBsShbSQ==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr5563052f8f.13.1794582949657;
        Fri, 13 Nov 2026 07:15:49 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm5971522f8f.28.2026.11.13.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:15:49 -0800 (PST)
Date: Fri, 13 Nov 2026 16:15:44 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] landlock: Fix layer composition of
 LANDLOCK_ACCESS_FS_REFER
Message-ID: <20261113.a61c6a4b7c9f@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-1-2b405fc1b3aa@gmail.com>
 <20261113.hij1gi7Ees1A@digikod.net>
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
In-Reply-To: <20261113.hij1gi7Ees1A@digikod.net>

On Fri, Nov 13, 2026 at 12:25:07AM +0100, Mickaël Salaün wrote:
> Good. Please add erratum 5 in this patch with abi-4.h .

Done, will send that with V3.

–Günther
