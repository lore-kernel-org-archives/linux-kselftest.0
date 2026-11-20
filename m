Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184947;
	b=OFX428fFWZ7xoPtORBMSXhS2dEuekU9qGWrG3Qb3xoRhFTTIwiwJcm1Jc/wBoJlLjfBp
	 SUy7aG980vz9hOHAH31XoZ6PR2f7auPJNa77LIDR+WpkTNZ0gYAtAMUfjTEyRvW8jbVLU
	 ZZJeaRbCaoWn4yBlS0JhUNpSmb6/2kVXSATi4M86IdDYMzFWFsRl3wDQcisV+AGYA09Fa
	 Ua7iV6+s9zqFiuIhiagm9QR++Fp2+5iryDs+1tX7i2EZZhUKgMlzbh4rLwD47HPIFbTxu
	 cJ1daxWXLxWiCap65k8td4N00Iy0jTcH9WvAfM56AhFDNw3hngvEXATnYlQTbwe7bEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
	b=22VvzORCf1sw2cUUn0g2wF4D+MlNMponpTZdLaMy1nwIvqkAIHLspWyizCV+tKN5HX0L
	 9A/xe2CxBFM432FPUuEE/AOsS02Lr+CnM7pWZxPUrM7VGmzvUzGbne2ZDzkKOwmXndVSb
	 m8uJhe3Exj2p/n/5KZTXWG+wVhge7kF1kRVQpAMLWcxzGqNgNWafGe0bv/LxNVDVi2CaT
	 Hb19fUFu3ZcKgONIeQf5YZNFw5o6qnVk4L8DBkI5GT1Suk2mbbtt6IuhboS9MFRidrjBF
	 8GXgVAboiBjg8zZtcWKcVSIGTHU5rE08gwvHvVb9gh6bP64f8OCDcmWky2RZKwQjQKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b="KGPM2/li";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2441E606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2441E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=KGPM2/li
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso1345653a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 06:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184945; cv=none;
        d=google.com; s=arc-20260327;
        b=jfkn26RLYs76s2qv3Oym0TLIEviem4AH2ESujJWGwmZ8Yca+VOncMdL8/NCVQm30/H
         d6w9SJ5NibHSGbwKexZw40/mn2PvVavlQB40e0M9qxIvlpd9j28smRUe9DzoO9z1O7RG
         CIYtCDSpjHUMeqxrpGQl1ZruGlcfSsx04fpRrH4k7h48ZAyjrn7CjOjxdyr1U6SGwrDn
         ObAynQwVY0UqJrBk/Cm5JiYP/99U/mwY6FREddMKgX0x5TFpjBCLukpZ4Z/izAeacUjB
         QpzhqzlpdQv+xd1v2Aw3b+O0sNgKrdcTUylV3EZoOBag9IEJ34oSHsrbqqhLDZB/W8Jn
         RxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
        fh=Vp1U5hc+eqU47eirqx30aaRIkFPH900q/93SU6YepPA=;
        b=nxmwg5TvK/jmo0NkvC3NoGNFOPvSsmtSwGQ8FZArOOHRDrPxdJwtDKr1JcGg/Exd6E
         iiNdQbKqQqNf4uZQSh93KnLiV8KWpAwlxyJ9MQ7F10KvpzqDewBi9e4hglpyD7vxYq79
         gVcNtX1z6VxkDesFx3yZOugJ9l83WHpXwSOWJbvZRWUWBVeUKTiUhwFhWK2v4YtIXqVo
         L6R1C8kK74dFfYDfkcoeJbgDmJA/cwDWk6Ji3x2QVKqMEx5QYpUGgiLBvY6SVCqJaZbv
         UPxS6t9NFumKol62G40SBaM5sr5TP32q0PPz8c5ZS5w1lxLeHAKW9V9ezHAXNwDN8dJP
         XtQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795184945; x=1795789745; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
        b=KGPM2/li2EqKJYsf/Gv0WBthhS+7luPZAuNGPpKyoFR0Tzkw/keRMcPSqNncdo+2u3
         uZ+z8CtXzAHyFe95zXtUVAzd3/EqXdFCu6If/GIpuT/0EUC5sR2s5ZHQAtrFj3wHUQ0Z
         IXdKQpGDDTztrw1WwuQaleOUwzoMUx9m7ewvakMso9Ku4mvH+wudthJmCerHjg1bYbRV
         o1ynKSSNX6Rg214EU/v8oT5eMHlVczo/yhDp5h56i+74PPC6D1YDy+Ll9n4D/UClUXHw
         Cli1pzyCwK1zM/moRyGGU2j/ZJ4fZUiQSbjkpPtk5urWyIMeD44Rglud1eb1xF9kceFu
         b2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184945; x=1795789745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
        b=Ui2BomQeSodCZiCsJ9xF9AelMiXBJPgqbCs7omOZx9K04FBhNZjGaH/lOzMTNZ7lKJ
         vT8JRTpSfT1Gf/XSpXptQjj9oMRQKsPSU0T4FJdwSAyOeNYhesE6kYQkPQKgWCmN/cdv
         y0KJ3yZcYu5QRziQRA80M6zev63e2ueD17KOwZLNeYpmDKfN69zhHDe7iChk0WxVpXOi
         A74M3QuMEiPZQzoJoALvrJYh2TfXPcf2sNHmwnUSePgftQIlk8amepLXKByI7lF1qRGr
         kaM2/L+zqlZnDd/Mu+HdhP7+bYG1DUIX2+H4BOFbmsmvNAHWHHWbxdi1Gtn7jNyrcouM
         ic2g==
X-Forwarded-Encrypted: i=1; AL+hErEZlMf8DhuhqGZySrPEQLqWjTR5T2BwsMTmAdFxnJp69DCsY6VGh90bYAt2dPi4Rv+Fl84bmOw1n77AtgFzNkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bD5zxI1VHG1+AYb0QAQKZJnOHeTuit/2zXiTGJQyrkTdBes1Y
	tQ8dPag1RVYCzGkyZ8vNh5g4kS3ccGp2bIavcTr13hmK0sUMoauE6xDpsT2mB6uKWt6PV8OgchA
	Eh2fIgBiGUxGxoOl8fYFKStC+0mZKagsfYrjYIMfhVQ==
X-Gm-Gg: AZFdTZemX3PTvK5qo6hSSCEBd4AQgxdUAnOWCc5/p/HvYWrT+Frz08ohicKFWeXEro7
	n6GEeMBNJMYIR1YRHYEYYvJJm9pyNMW9jVKOPhaWKNGcj/ww/1IqJE/AUTz9Uj1Ar9ku/6K4s19
	4J8dueUftVrA2FRiLVzNMPc1tdbWOtjiwomGQmXXUrJzBdxdewo4yxuzyBHSIqc0GISfh82PAUM
	d9CRdzzZz6iZtNg7+8nVhiv8oTTQwlgjB0d2/ojrcmwGYv1BcJEe/PXy3vgsZmP8rx5MHUl6bG/
	D42j7YNtvDQNIjkAt6+373DnUTuqHSYsy5Y2zAWNd2eX6mGIilrvXhVB3Xsx0Lq+tIS0TMe8xZI
	WxXxXBfp2MDmT8Ylg4qetKUuNjWTZVyd5iA==
X-Received: by 2002:a17:907:ec02:b0:c50:aa10:d898 with SMTP id
 a640c23a62f3a-c513a859528mr312083666b.26.1795184945410; Fri, 20 Nov 2026
 06:29:05 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120121614.978396-1-rmustafin@cloudlinux.com>
 <20261120121614.978396-2-rmustafin@cloudlinux.com> <awA8o4oIq81a7J1z@kernel.org>
In-Reply-To: <awA8o4oIq81a7J1z@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 20 Nov 2026 21:28:53 +0700
X-Gm-Features: Aa3M54ovtmNup2lPY6rNVpSaJu-oUVw9OB9JbjDeYfkHzHe9GxRDZx2A7BPFff4
Message-ID: <CAG6=z5tzc8DG-7gU03mKs1JxqEzUULwBinfHKtYWyPycKkG6mA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tpm: Track the response read position internally
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Shuah Khan <shuah@kernel.org>, 
	Jaewon Yang <yong010301@gmail.com>, linux-integrity@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 7:27 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Fri, Nov 20, 2026 at 07:16:13PM +0700, Rustam Mustafin wrote:
[...]
> So... why does not this block uring? You are implementing a feature
> as a bug fix, or so that it appears.

Patch 1 also fixes a plain read() racing a write() (the second trace),
which does not involve io_uring, so blocking io_uring alone would not
cover it. Patch 1 is small, so it might be easier to backport.

The io_uring block is posted on top of this series:
https://lore.kernel.org/all/20261120142116.1630010-1-rmustafin@cloudlinux.com/

It depends on this series, because the new ->read_iter() would let
vfs_iter_read() callers such as Coda reach tpm_common_read() with
their own offset.

Br,
Rustam
