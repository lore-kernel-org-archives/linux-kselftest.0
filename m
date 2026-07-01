Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEAD17C203
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933841; cv=pass; b=k5cwI98Hb/gpSU/CIv2i9XPOpaXmkKnmddrSjnS3EtNK6vJCBpd0hUcRn7MM3BlwS4yMIl+ejFi5JMhOPmMfkaoqwnTNW+3OXKF4d95iOWeSVIcGbGj2e58l5B9t548glUBdAXmzcuNa+xo8IZlGTN+L5pyqOQWYX6mNxqFrick=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933841; c=relaxed/simple;
	bh=dsoYYFj2xtXzxEQ5IJrMmZ2387VOR+HXTHuw2bRS09M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7waZhSe2IpSBmzQ+wsptwTg+MQmL/Yynt+rDGfQ6368pIcU9qyFQ5uJVNksgxgALkSCwBqePwJq08E2box8GKEXyKwdKXt9ottRRoruedMowglU2D+gugq3KX5Czpqn6ErpSs+3iPXW9GIBFO1XKmkKv7W25YN73mjysL94eI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y9L5Dpy8; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9L5Dpy8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so77295e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 12:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782933839; cv=none;
        d=google.com; s=arc-20260327;
        b=eLsxJ2ldPhBoCT1VhXZJcbhPj2D2M1aPwF9Gt28lcAPFyGU0v66EDFb1OftOcETaQb
         uKkTTAHD+9ZQ70WbHWwTFAl0zDxCFDVMLyrINwI7OOOAgHvsQvvNvYmYyQX5q57c4+03
         rxFGQBdUalOLgdLpInxoWzzlI6pCY2Z4sHn4c1e1rBh1f9P2Niy1nCfbLaGzAFAGlk7x
         rUsoVDHcvQLxp+CmwMsDft6UJ2NWqtxjRghFi33kFIjEsk8f4gytLir3Fxlpz7uUD35s
         5yslWd1AgJac+tJr/mofYeFATbnbQkBz5hw+BVgnyflx8rc3DkxrhLuNnmHaaoergI9p
         sACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsoYYFj2xtXzxEQ5IJrMmZ2387VOR+HXTHuw2bRS09M=;
        fh=h3SbdyJ9kQos2wiJ3itYgGp92mbU/CDEtnz35QTUuBo=;
        b=mUbqIwO5qy61EwO5/+oq0Pdia5pHu9SLn5Tny1Si7sk1EbOclrcFbpSfrCBQ3GD+U+
         U94+qCXwxE4vlIA2Shyw+VVkfX5TRxY0VU9kzaeQKxc8uhio3W+v5EcsJ14nrwTum0UP
         AatFAw1ua/KEsMVWAqTiv5MNidbJgDFYnubKaD1wcfGwA3LZLDBRs+lk01dO2F/HPVNy
         N7FQRFrRTO3G/bXtFMHMRQumd019EbgbMv+h9L/zCm+Dxckwvb/N1NIb1z8f9Ga4e90e
         B47u5j55++IG4WrafQTYbqmVCYUuaeTLOcLeprvVZJuTyDGtTrtqrBprHQoSrZb8rAIx
         N3ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782933839; x=1783538639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsoYYFj2xtXzxEQ5IJrMmZ2387VOR+HXTHuw2bRS09M=;
        b=Y9L5Dpy8z/KuMsCmndEzdcnpi/Mrwh0CFBg1M0fnL1iWlsS4aPOnfH4bNx1PqNjsQA
         pQePWlFcyEutcYwiX7JyQx/G8uWeFKkvEIVjLn+Kdk5xoEEXlnu9eGefuvVqTBH8RxDL
         Y4L9yGAlaB5zBcfRW6QlfIA2WMmv45zEN62CdMkdRm9ml7esAVntkWNVxNvXXlaY1vO8
         qKl1ubOdRLOQu7wH9O6cJ0ONfpdOx4AZXMHbFTqcgZw5rEsvKcr5f0pn5/PcmENO90mX
         WXq4EUtBPB09QMvHl6X28/t7IzjWRd66e6Z4N4SoLGQim2pyRMLo41v5j9S9AFtdz5O5
         VVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933839; x=1783538639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsoYYFj2xtXzxEQ5IJrMmZ2387VOR+HXTHuw2bRS09M=;
        b=PbuuYSQyQy2Zdp14wNCefh6BmX6i6ccvfg5QpJjeEObPTGFlmLvHbWv5qelI+vy4cr
         EE3XUJ41hQL/RdklSygwAhPnG0gufBag7Pd2Y+h63hjtOb4UQtYeT6YxiSx8B9UKf8qU
         ShMOIJN070c4YvrGsvstRnqWCBJLlKmWoOU1u9JprcR4ED0Et1P8PQkf3Y7iKpnOscV4
         IJxskRncyXVhbck+2HXBzmSC4PlWJlFAJ7XlI+JNf0Pkry/o2Ulg1YiPm8qHMQQLb0WK
         f04obSxamrzdqbxXz+oBxX1IfwJ/oD+Aj6jpUQ/i0E6/Hu1IBa65faheFsMF6v7YVMj9
         wrHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uoeuQqiYBeoIDmuOPE0Yj9xohOtviQHJlBXsRhJuazlwpbhmBAEWWW1/fyMxq0RuYQG9sUf0LEbrZxopuQjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznJ/W7D1FEG/4Y/66557i9Uvt+U8TQ7FvanKdlL5s5IsiYS3ik
	OT6JZ2LZ2r6nt28mDBdNpyGbrhzcGcFZDj8D/S3GzcQpYZ/khP35FHr7uxSy8tIReQ5VncjpORO
	USMBMyrHuLjjD+eIzxzWdUFndDIiuUsuMBYP4WclP
X-Gm-Gg: AfdE7cliYrStZPo5peOlXXtO2nkcKFLpyObD/Zx+2FyGs6aTfmV9gxlV3tQ85BfOjPN
	VygJb0QO1MMfq+28GzH3jSU6UlCbaoiZBmASEVOSDrwXYZYGefy8qIZboi+iEXjotd/MylKJkyg
	vb2Htp4jkzqprE1BpLftVi+2S/aulOa2Wcuzn/ml+BU+33C2YALJR/F+oFsKPbXHzVyJTVn/ajb
	hJbVHm7O6fM2jlXiDR214ltnkuUDoep5dF/gB7aNaGiruDb5pA6lxpf3vJh4SUYlR9uf3V/X10U
	4iAmj7/r1sZQeAL6AiT75i0zPpLc9Q==
X-Received: by 2002:a05:600c:4254:b0:493:aca0:32e2 with SMTP id
 5b1f17b1804b1-493c0b8dc60mr1101445e9.4.1782933838708; Wed, 01 Jul 2026
 12:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625181557.1086105-1-tjmercier@google.com>
 <20260626180941.45158025@kernel.org> <CABdmKX2oG9m316hiJpSXbujrT3vgE5hUpzH_WHfjNxBJ1_+BdA@mail.gmail.com>
 <20260701115708.01213909@kernel.org>
In-Reply-To: <20260701115708.01213909@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 1 Jul 2026 12:23:45 -0700
X-Gm-Features: AVVi8Cc9XyUG3uGiXCOCq9h4RePCwClPydes5CEX-eBZWcC0PMTerb9YxE0VoYs
Message-ID: <CABdmKX0bkWgMM4LNLFj_=egSCNSL4a2cqxARu0f5_wgSpjvd3w@mail.gmail.com>
Subject: Re: [PATCH] selftests: Open /dev/udmabuf O_RDONLY
To: Jakub Kicinski <kuba@kernel.org>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com, 
	Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 11:57=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 1 Jul 2026 11:53:15 -0700 T.J. Mercier wrote:
> > On Fri, Jun 26, 2026 at 6:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > >
> > > On Thu, 25 Jun 2026 11:15:55 -0700 T.J. Mercier wrote:
> > > > Write permissions on the /dev/udmabuf device file are not required =
to
> > > > issue ioctls and allocate udmabufs. Applications should be opening =
this
> > > > file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [=
1]
> > > >
> > > > Remove the write access mode from the drivers/dma-buf/udmabuf.c and
> > > > drivers/net/hw/ncdevmem.c selftests.
> > >
> > > You need to explain "why", too. Why change it if it clearly
> > > worked for everyone running this test until now.
> > > --
> > > pw-bot: cr
> >
> > Principle of least privilege. Folks use or point to these selftests as
> > examples, and then wonder why O_RDWR doesn't work on systems where
> > write permissions are not available on /dev/udmabuf.
>
> Alright, pop that into the commit msg and repost please.

Done, thanks.
v2 here: https://lore.kernel.org/all/20260701192210.2997769-1-tjmercier@goo=
gle.com/
