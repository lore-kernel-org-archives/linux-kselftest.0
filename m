Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC84737F8A8
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 22:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711456; cv=none; b=Nl60QM15/E6OClt+fKaH9mrk2sUQxmw95dZKwsuqwF+sfTQjXDw814R25j5sSJXgFXyhD+Z704D7fQ+6atEGB/4vCd8gcf1G5lJXgfrNEaVFtlUJjLOps2XDdSt3Duie6VeOYrLF1G0BxOJybLB8nlk4oJol+J7rUMiav2h6sFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711456; c=relaxed/simple;
	bh=BdzeFnM94A7uHGNdIfZzoHy38lcfwYKhB0qbIcZ+fXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=knQX8GVDj7CFWXXiISaGzye+z0i4xnpEqo4wSxSZcrhSu1cooWKVBMdw7yybi9UIi/JNDIwoFcnj889Gsv3zjCAsdRGM0L7Hy6c1yDZcy62bKWMVGIMRLaabw+WNrpyArRJf+TsuUSMHOoQkB89WX/mvBrlZ48Ldb+80HJzkUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfe8pbjd; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfe8pbjd"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-130c9dcbd25so6731992c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711454; x=1779316254; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BdzeFnM94A7uHGNdIfZzoHy38lcfwYKhB0qbIcZ+fXU=;
        b=bfe8pbjdwGpPsFP/YbR9x7OV4+uaG07u4svh8xJxDLAJUS2cxfJC15ZO17zAp8fIS+
         RXFR3vaeB1GGA99jy8+Tx98iGZNkS5xeJx98nVyw/tvAdzJEl9DFIHj2dlqspo7k7OBj
         Hc7MPMwmaJU6fm/ToWKUrOkykmlOQ0GCt+qPz76Nwejw+HL34wZLBSJu94AK9DT+boW3
         HjP+w7Yq+hkPb0JVMD0oPu638TTNpNpIfmrIHVDib+t3DRVN9VD4jMQtThr8OuJegbVa
         qd9S8or9rPFMb0sjPDdYb4R4tf+jtX7a0BVRx7PSw05tjMt88Vzld/jn3MvqFLiMamIg
         qzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711454; x=1779316254;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdzeFnM94A7uHGNdIfZzoHy38lcfwYKhB0qbIcZ+fXU=;
        b=SZduEQkopJ6jRUqt8Jpx4WSMdWcZnISEu7zwQziDFLT0eOkYmLb/jkZ/fkcmFrvPf5
         HfJXzTbsafPTtI6Q56KEp96L2f17aczpjF3/0tGIUaKHMvK9t6/3rUc9ZOJOFamWK/Vg
         OYkzrJ/s2ft3FObWDQ4S9qmDoEo2/A7XbxXpMXELWY1M0dT3O4CM9xbxtJLy/LJaaBOJ
         I+hPFh9jw4LitI2xiy2rvVCkBipDhoEuA4LUiWLLzopqLNM9xEc0m4fwvjT+Q5P60YMg
         AClBtxMVTwsmdVPhP1xunx+itDqyC6al/RTC3i24FcJL4RqyFHubvcOPDVsioKMlFrHd
         QM5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+owbLZuHxcFI07nNbjfdR+U5wA5cU9CaQUExUWsnoHBtHVPUltqVBK14PkokPcb0g2dzaqtpHoYfVm6ktke0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7BCwovWJqf699tzCq3lBcxnKAUC5288hNQ7uy0P4Dj2zxzJ1
	qDCLahhLSP3RQrCiSYcYKfTSTG1HOcbBEHZeI4QsnHTvZhWx3uw0cSMi
X-Gm-Gg: Acq92OFzN8/685dAqrVJ2fJlsjdcISq0Y8F7U77OFTktrIDU0Q4lujE/fXJFPMizYrb
	58KfV4FAfOPM/Hwblp4eOi8UZRCXIFB9orpPB8C78QMIFgK4oZkaElqgwMyQf1OTv4R8UhPC9qO
	6lhaISwYOblZLiVvdIAUi+BgRyPlQHT4QodC03zpd6jSqE2p1pOM4yOjXz4TwAxCPz9XPNpJLiT
	bLXFLrL7EY6nzNXD6fmVLdY8e1T/hELiSBb+Iegre+NHMDErg6Dy1EpMdKjRo+ToI87dsdtaPkt
	7EUDv5GmjK4ZTP68YdrJ1B+WX9oDJSmbiagLCuwspMA28j1tTrmQ+kigzd3Q/hKCJ1VafWFFPTv
	/eLRKL4aRdtRr0Te9RbB68KWfF1e3PRbEPFfSJda2RHUa2TsqTJdxiXDXnEuxejCHZ1rW9Ja3sg
	URHRZgKoENJLZbfJO8sFry5jwveqd5he2l08T4qm+a3MYKrpI4jUQqBKbdwayjsRXiNAPl2x9Ro
	hyX69Y=
X-Received: by 2002:a05:7022:608b:b0:133:52ca:7dcb with SMTP id a92af1059eb24-134c8b337e3mr793467c88.10.1778711453723;
        Wed, 13 May 2026 15:30:53 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm1177799c88.12.2026.05.13.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:30:53 -0700 (PDT)
Message-ID: <38185cd5ac2c6103ec5af41347c5a76239bc670e.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 1/8] bpf: refactor __bpf_list_del to
 take list node pointer
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao cheng <kaitao.cheng@linux.dev>, ast@kernel.org, corbet@lwn.net, 
	martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 song@kernel.org, 	yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, 	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, 	chengkaitao@kylinos.cn, skhan@linuxfoundation.org,
 memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org
Date: Wed, 13 May 2026 15:30:50 -0700
In-Reply-To: <20260512055919.95716-2-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-2-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-12 at 13:59 +0800, Kaitao cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> Refactor __bpf_list_del to accept (head, struct list_head *n) instead of
> (head, bool tail). The caller now passes the specific node to remove:
> bpf_list_pop_front passes h->next, bpf_list_pop_back passes h->prev.
>=20
> Prepares for introducing bpf_list_del(head, node) kfunc to remove an
> arbitrary node when the user holds ownership.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
