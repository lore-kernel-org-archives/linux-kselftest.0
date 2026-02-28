Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5BB175A66
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 19:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772307991; cv=none; b=KXyp2xGmnPqwaAeVoYpvYHSmtFvr38EIrd02bVf1B8MCEBHtlRynZ/6mBmezXHf/sAjFkt2rXUsn4WnaivSCod2JdqnTi/CM/j5RAo+ih0Mhvb334SS57+N1snYM6rNYf6kIQyrdbOAB/KT8c16qRQhpBp49EJwgM+0UP/w1cdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772307991; c=relaxed/simple;
	bh=s7ndiwbggfXGwArebI/3uekEoFY4lPZ1GxgWNfjoKjE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=MNws0JH0DmBRiO4JNz/HDBxyi3Q1eR70YW2TQBIsxv0FnsCC0GkSYrlHyUrOIM9gU9LuENBmDnyIikATjiPYacDdReJcu3mRffeawGHKr6g/2tr1u3s0A2tpicpyfSOxtg9DDBxLUha6VqD6X23P3wMMrjw3R2nsGxkeBARFigI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXlzEgD/; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXlzEgD/"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-798374d0f44so57882387b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 11:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772307990; x=1772912790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afXO0Q25yG22NUDyiXMSNWqDgXsbVEFPUKFeke05sJ4=;
        b=LXlzEgD/uWlKxS08CDFwhs0VaKcz1ZN43Soa3HGkOI2ioi5IKyQeOHkswW9XQNv1/X
         joM8vtUOPVKbqB1fb3XjvzXaEvRAn520U+m3k2vSNuxzG/AcrNylI8K64A9IR3o0FbG9
         HI48GViHhvPCtN2hlXisM9ynXiFXrbJ9DfMZ5GGnQ3GSkxSNkpB95X6hpoeZ1w8gQ9rF
         LOs5/FTwbKtC9yGO3J4JBqaH2hZ8KrfiLgsck9gXlRvV117vD5t8ZmC2wG9geXFSfkSm
         PtByHhHVZypq2u+1UGhZgAUPtjmJM9jC+slUBtNv9T6QVHXcbuZwJpx8QBkb23peAvdG
         DG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772307990; x=1772912790;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afXO0Q25yG22NUDyiXMSNWqDgXsbVEFPUKFeke05sJ4=;
        b=knAcs+CIugBxJ31uPuTRdfsbOsWRmFASNhmnJGj2Pkf1uTcFsx7K/GvhMutAWFi6nZ
         pOxRp3AHBz1WeAqM10idZWFEPW2l14J+xGGxBMhhqfon8tSe3lWHaqfH4idXqT1xg0Oj
         6E7+3ezoO4+EG+F3/5Y1c9cV5dHLGiDBMAvHXnW6lKn0PeE3CZDdczZGqXrGNcquZxKP
         kzLZuZxT79KZ0JXkJzw6t1dlLKY3pAKkLaCLVs4qEoBcXqFuATKJEX6oyBLm0ZFRBt5F
         pZhPeyDIvC1AYrW03hRMrRHpG4P5C48dO5aPmolVvzTMakYQRjXQJkdcnfs8q2bXU9pn
         npTw==
X-Forwarded-Encrypted: i=1; AJvYcCWksp/V5ZSsuMGBYsjSoObWXcpkD5kn/8uHxl+OUsCfc+FSscHFVHXs8tcaaFsHWkj4BH/qY1SmTV4nXJEEGGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjA6JnAkcJGV9cRNCkEujdlvdop5U+HNTXDANZw20JqMV9eSg
	YO6QcVN8Kms6OK/GIyK7zwHBOllxXoa/KmoSPdCMULE9YzPUyksAsKbj
X-Gm-Gg: ATEYQzzPMAUO2aqmWK3wFGj0ME6xy2Y1qGeTBO/aC/GvDfvA9dr+znSk+KLb/CbIMoP
	LWHbhwU+/WAceI+MifuWJDYyDwsFUCEbp/KywtZdpOLbDn2TIonoIJjID7l4rngXYjQJGQSRCtN
	gO2jfplLbyzOVOICQ5vZbku+lGwFKAi/Tno5JH7s1TYJKH1bYPMgiBZKGyHTs9iz/XEg0cVFUXI
	fsQfm8H+w1zCu8QFGVgQvtToAgmLAzsPWT/hlj0q9Ov12UMVWfBLBLDl3/Z3UkSkkBr/M4cXEt6
	XNZYVCmiYn8t+lBTaROuLGqKkf4jKYsZk8QEZ2npPTXuSzR9O0mvH3ye5iyYZaEtU9pR8Ks5p1Z
	nD+K+qtZMHty3eprsRzWoS9TLUzgKAPjkKpIAjhC+rYDcC8T9DBShZIKSVv1HRPGYoxoqLPBa2c
	jHQToXFMVlcCOzaLc7YFU4RB693t240UrwAyFbzmLfqIQunRbQEXw/zNu55ddr+QEh9EHjKuc=
X-Received: by 2002:a05:690c:600a:b0:794:8a60:77da with SMTP id 00721157ae682-79874ba383cmr95437367b3.11.1772307989823;
        Sat, 28 Feb 2026 11:46:29 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-79876ac7505sm34024487b3.14.2026.02.28.11.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:46:28 -0800 (PST)
Date: Sat, 28 Feb 2026 14:46:28 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Kiran Kella <kiran.kella@broadcom.com>, 
 willemb@google.com
Cc: davem@davemloft.net, 
 edumazet@google.com, 
 daniel.zahka@gmail.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 jayakrishnan.udayavarma@broadcom.com, 
 ajit.khaparde@broadcom.com, 
 akhilesh.samineni@broadcom.com
Message-ID: <willemdebruijn.kernel.1c3d7105f1c48@gmail.com>
In-Reply-To: <20260228100449.19f6ef13@kernel.org>
References: <20260226184654.3180648-1-kiran.kella@broadcom.com>
 <20260226184654.3180648-2-kiran.kella@broadcom.com>
 <20260228100449.19f6ef13@kernel.org>
Subject: Re: [net-next, v3 1/2] psp: Support for transmit on logical device
 when the underlying transport device supports PSP.
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Thu, 26 Feb 2026 10:46:53 -0800 Kiran Kella wrote:
> > This is achieved by propagating the psp_dev from the lower device
> > to the upper devices in the device stack via a netdevice notifier.
> > The lowest device owns the psp_dev pointer while the upper devices
> > just borrow the pointer. When the lower device is unlinked, the
> > borrowed pointer is cleared in the upper device.
> > Assumption being that psp_dev is set on the lowest device before
> > any upper devices are stacked on that lowest device.
> 
> As I mentioned in the other thread I'd like to establish some clear
> expectation on where psd propagates automatically and where it doesn't.
> I don't want to see a stream of patches that say "fix propagating PSP
> onto X upper". And conversely report saying "PSP got propagated but
> it doesn't actually work" (macvlan in bridge mode etc).
> 
> Hence my preference was to require the user who created the device
> to propagate PSP. Willem, WDYT?

Can you give a bit more detail what you have in mind?

An explicit user (netlink) API to associate a psp_dev with a
net_device?
