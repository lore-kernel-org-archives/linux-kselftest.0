Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDFE3D5C1E
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742249; cv=pass; b=EsNoA6Xc8ACLnEOWADUKWCvKbzJHfMw4Fyk9TI6LnZfN2GXyJAT5EQfBpLCRJC7N5v7qt64aLr5I//BRCo9TqCUmwK7qM9qc96oMZx8Prp3zYrfS1lq2SAT0oYQ+tVcinNsHgI0B48+OjRJSn3mOzdRCcpEtUkHRGfykuEJ3+SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742249; c=relaxed/simple;
	bh=weqXldJIdnSFw7RHim4Ib/9v4hGZebyt8X64A7KIjlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoMOniBWer5UryCeeC8JhWn49bRloc13QfyBmrSjVVodUh3X7EetQ429Of3Cq2sRvUCyHKzJ/YEmdmb3bGBt+kWXvYb2SPk+NqsX1xg3joMQt5yFlI3FNfP3fsfbahs0J2jvuhRHaRrpd+coPxmQl/wkP02i4a8v2f+nofeY9do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A1ynqKsi; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A1ynqKsi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccdf36f63dso164105ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 14:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786742247; cv=none;
        d=google.com; s=arc-20260327;
        b=dIJJEHBdoimGcA0FID/jRBEOiRNCYTaOB0tHbU5nqvhzD77YawBrkEXWTX8SOebQEi
         kpflCqBthwmyngeKZ01KycuTKim7LVH6SnwneO8+cM6NvlMINBRYYjUpy5DbChLqvB/b
         m5O2r+4ELnuyCV6FuVnmI34qJeo420Rc8Kz9OwoRedwZHRre4R/ba8u2mX2rhENWSQY0
         /gVUkQ4nU9iHB5lNzJAmXncBDm4NP+ktfK0uZI412s+wNH8qKf7mpu02NFcXCXBTGYNc
         0DkDruOx1NVweEGe90ksxivycfWXSvRwkZIXUTcObReHlx+yovOUoiQkiQCBm/h70FPk
         89Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=weqXldJIdnSFw7RHim4Ib/9v4hGZebyt8X64A7KIjlE=;
        fh=RmqK+QFTa3HFr2ir90JLHvwJAFJ7FkOqcjn2wCdlnVo=;
        b=BV43g2hzuq+q2++IyMgGvC1hcuFvmOt7h6ItE+ZGDY4hTkaohfLAvnzJSWUEKFt6Q4
         Uslxa5IOExio3rNDbkbzJjMW8Mfmi2I2S4SKb9OP0bit9YE/u8BXoQomNEk+8Mn6U3Z/
         zo+aDcXbwa7QO7+hvxvKTDweIRyzLm1tYIpLJTtaHKMnqLjQYYelM/A4i35qGNrEbtI4
         EfvLwXE6OquYoheDMvV3KnkHCc8fQZzrSW3dVkNVR9B7EcihQJd0ix6hZh0ne43g4Bxe
         FAUyJxsgIOry7QWWk4hPvvg37n4pYzJa2qVerarrNDZSaYdkF4gCnOq3O1IAXm0NYBpP
         NPFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786742247; x=1787347047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weqXldJIdnSFw7RHim4Ib/9v4hGZebyt8X64A7KIjlE=;
        b=A1ynqKsihUIK+JD7zuFjbCnwoRmOIJ6r+3SI1kLXjGj/sukDEN9dKFgulFZEXqtuVt
         RucO37MvgVgGEL29gTE+DTwvPL1PQP7wfSUUAjbIn+w5vDrBpgmdD795KVq/uhKJOoVZ
         7oPgEGjH9BnTGXZEGRUMzmsffUfGmzIny5nyLmJMPvuU8DTdj16imCBkCpWBnWIircX2
         UZFERhizveP7CRZ5K8QENpKytQAuglLcL2j5TN3MeYxnBci4JP2M61YLSXcW77PyGvPq
         6M1S0miYrkY7ZXy7ScfYEj0AkP02B70n2lF5RJUX7zjQtRm0xc7TIgvjSpmYIqLEatLk
         jr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742247; x=1787347047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weqXldJIdnSFw7RHim4Ib/9v4hGZebyt8X64A7KIjlE=;
        b=SlvmKFuFy1n+LPLGwDN5dIHGoSP1C+pC1zJmJysTMmKzYM7LgD0+9IMht7lVGf6T0/
         TdC0Mh1X74bjXpqixL9sHdXnHXat6pvCwXC5Rpw0f5q64fUl5sXGK4qlVMVy/aciMK8I
         D6taoR4a5Jchg4qZLdifFw/3xnNISePRgPXbBPMAW1CDmldexX93V4OvEPugmUJSDEBP
         o+XJRTc+uxNFui9SA7pySgBZmxKKf8m9k6ULMzbO/HMvqMCh6tQTIR+dV7KlF9gH9qW2
         8EVdeXRdG7oMAksimAsvSqdFZZ7Rb+IUBy57RoAB7zWpG4w8oygtfNnlfV6hx4UvHGei
         6c5w==
X-Forwarded-Encrypted: i=1; AHgh+RoEURcNS1VXtLSfoxAvrJ1HYKwzvXGUpCzNXH14sgTq0DbUMqniG1gjkhsmmYWaj4/d667gO3P+9mK0Y6sMUtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwSdW4WIT0fCAuOEEg3cEypwMCjbPBl4ur5501xJTshLemWHO
	ReB5nC30MdmEnawAjjHj8pkFj32kHQ1ykq6E3GbHyMjVNbk0LNNBD2YihseIx9QNS0M1ugGim2A
	Q8ZoTqvzCuGySEs+EGndSeeox2K/4y6OgfOs5Adcp
X-Gm-Gg: AR+sD13sTLdDT4mwl4cheM7INCsgzoTheEgRo4nHU2g1Z+8ZxFYvkOb8ZwtoahrUni7
	5RYuQ5TG9cbpb6Qz5kUKPzUX2BT/jjRYxMF+k5clsldR8cfWVOs2uiuTP9GErZbyciPwKb5GZ67
	NQaJKWiLiTFcGVMk0509DjAWmyhisP1xBP3AkZX8Bu24glbkUrKeFkhUR1EF4FsyQB6qhwY8pUT
	7dEvM1/7y0GahuKD4R0tMHF9v8FWKpkMd8+lsvU3jYVjrG5YCKty9vRw+BI/ZBW0lv4yQC4c05X
	xqpFIODG/1S6z4WHihgDHWt25Kuk7vIg4zYQ50fhums=
X-Received: by 2002:a17:902:ccc9:b0:2d3:153d:acae with SMTP id
 d9443c01a7336-2d3aeb797a9mr11982755ad.0.1786742246677; Fri, 14 Aug 2026
 14:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803181852.491437-1-almasrymina@google.com>
 <20260806121631.13175f7e@kernel.org> <CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
 <20260806133435.38c34e31@kernel.org> <CAHS8izOU2pxfQH0Wo1DrqajOb54wv3Y1rMryGpwjNnoUsEufew@mail.gmail.com>
 <20260807145444.6acf9c08@kernel.org> <CAHS8izPQn6a_eUgeL5otUESTRud1COHXg2SuR5g9qce1xJogvA@mail.gmail.com>
 <20260814133943.45c411d3@kernel.org>
In-Reply-To: <20260814133943.45c411d3@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 14 Aug 2026 14:17:14 -0700
X-Gm-Features: AUfX_mzht8NILGOg0TkAAMoATbNVLNe_NrQHwRZTWSWRTEzdY2uBLBo45E3kVag
Message-ID: <CAHS8izPpeFTWw9rVW9XaKEf_9hds=Gh_Zsp-DCU7CVpPYkCSnw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 1:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 14 Aug 2026 13:24:48 -0700 Mina Almasry wrote:
> > > No no, I just meant a trivial test that installs the rule and maybe
> > > sends a packet to check via getsockopt(NAPI_ID) that it arrived on
> > > the right queue.
> > >
> > > You can probably extend ntuple.py instead. I was thinking yesterday
> > > that it's nice to have all zcrx stuff in one place. But in reality
> > > we already have a bunch of scripts testing zcrx so ntuple.py is
> > > probably better.
> >
> > Ack, will do. I assume you mean do that in a separate series. I'll
> > submit another series that extends ntuple.py with 2 tests, one for
> > 3-tuple and one for 5-tuple flow steering.
>
> Same series, please.

Ack, I will do that, but I had already posted this fix alone. Feel
free to drop that one while I work on another revision with the added
tests. Sorry about that!

--=20
Thanks,
Mina
