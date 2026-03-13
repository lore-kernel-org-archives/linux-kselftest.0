Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2930EF7F
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412093; cv=pass; b=RD/fbhRvSBRsKILhWMPQw3W7I8Y5RneZC9XmwEut6tbtgPaHhUL16ewg/CXZRUNDURus2sAjs1i2wIszAUPTWKaT+vnB60dcVfuIFoQkRPWzWsLOyFRNomLc8ZbCA17+Ui8Y//ifn9gAkwmhp+5cQ3makQY1Ckz3aH4JKenrXQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412093; c=relaxed/simple;
	bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z79iEO1BXCV103I8fr/+T4MqXAkz2qDaDQZIRMOarocMhUzXR8YtCce+v5s1VD0kUQkNZuugrZWvaQ6M4gbszAcLuujG03dl69Q5aCG2XkkfVkde+1XaYhrFJ4ZoArpOQi+FNzsQPz/ncgI7qQtTGnOB0C/f9dnyu/hatgvlDWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YWB87fJu; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YWB87fJu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6642c9254c2so1009266a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 07:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773412090; cv=none;
        d=google.com; s=arc-20240605;
        b=hUY9EsOR3UEJDLOieCKCYB2ehy+A/9IBdQBKBkfTVIB1mVZLNsg9LScjWQrr7Sc+YM
         5YOI8bqhU+3ISuP261QoGSO6ut5AhlBDcu1PQQFEz0Yh6h5eIeCSZygnUvtpzBbUMdS8
         EmYT+Vm6ZgAiOC0EMtv8s0JFbewkDMyQGWqkmLaXSgQ+tgSnxPeuhy5FidylvP2H6oEx
         hjd/T5h2bDDJXtDNOFZ7GvLplLnV5GInn2NlaYS02DQ7ZBiwsL9mu118LRTN3qTImD33
         8q4ZngV7IjY7c2Ijq1hoOvWq+bT92f2gyrozlnlxSlH0/8z7NJyC7WxePOi3dHBxV74V
         gGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
        fh=80U792ImeZAcLKJs9DCX30YXSfPEBFjS7cCb2pOmgDw=;
        b=UNRZD7F2nteZCMUe6LCw6RCYiJ7mhCjeHX8CWzL89Y+N+Db0QorvW/UU6vExGOntgv
         nuTeLTzplK0OSwWkYx9IatO27yES3fnBcNw8jnBG0WZtllNFz+2Hedaekwbx9w0HUjSy
         kiqVmmo5uyX9zWO81FgFQieqeY2BsUgTz7006Nu2t23dGbQCg0ktkv3Xur6F6hdd9Tt6
         +tAs8kDPH1Et0KIK8iHhV02QdFWnHc47iQuDb8R2c+e3p+lsHRG3FoLCSuHlgT8Ui9KM
         E5v8iHmM9oXRHUJYZZXcQpDNZUqaYPcofkFP/UK3VL83jhV8o526zAmfCPG1cSZYQjZv
         bkGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773412090; x=1774016890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
        b=YWB87fJu1urKVHYo0MietW1J8yEK9dBucNkODt2BZV7FSS2FrPohmTdi/nTZOWcvzL
         mWwh5Tq08dzYSAwWdFMpHd0JgwR5JJrMJkCNh94LNN+0BcBeR7VGRXO8B76QeamtUgDr
         pxPFHv+LxsPO7Osn3g840JJyjI6LgEKSzuISp9fpgbShhzaikX2bcX8d5+CQ71//B8H+
         w3rs3wMbtcj73jePmfDU1F6X1iH3OLkjbGX6ru6+drlOLnYyNLPJxNfF75eh3oJxxNOc
         b5B/yvERWCKrj3yt1SwhCPJJdJkhPRFb6ytDjFY/QAArmFB90B3Qs2XAB0dFFwgjdnFn
         4Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412090; x=1774016890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
        b=S2PvHBtLl0Zv82PRAQOiilw5qz1/SC0j6jifjATu7uhYGMtOw6VX3kFwZVZJrmIv1l
         vudv3m5QtAtgUK3jwOC0ftUaDTWsQoOhQT/+TyKsgF81hrOerA20owipuxtCaYnJumbX
         1+33T1fzVolZL7zpVh4TiS2CbepCbFro7iFEtQE9qflnu8qcjbBCZzGqKncux6or2yHG
         FgFDXCwXsFxTe6WrSjwQ4lm+s16/NjUYGCLGtyLD9WGdR9Z//cpisWzeiPZo8O4rpNK/
         KbtBcOvoKxlT2MGkRUXdp5sIA1GUSA2zwhj4dRBM3D3bRmcMzDwVagoK9lgS/bryHGtf
         p/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa886G5jnm+60tnupyty2FaHI6dkFdawI9MXAuR/lLtyhxZpq2V+a4ymbWir19qbXOPil0pwfJ7z2sGZs2yGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKo2f7hZSMeOqQInzFtPdc5LYvTVbIkO6EtmM+2p9O0cfJFQ5L
	ZLFysvLyPEeZe4JyxyA0bPHUnG2DMeHNlqE8R59zs9ZqA1rZGFsjmILqBgaFswdfojzMykR8wip
	+XHqrRmuxPXJOk78COjoHwtKjytg3vP9V+sosFk3DBA==
X-Gm-Gg: ATEYQzz2/tlkOk7Ua7eFyi3KHpyM4EfKDE2uaK1Phf/DfG2NSfcSu230E+f//+dSzyd
	yKkstM0kyZSFC/FeICbtEMJ1bVRCOGqFq6Td8F922NyqV+JSy24uc6MDmwz5dVDVIYBpAkTC8ih
	i0tDMM3tq3wTSo1e9RG/+hN0/QrBm2H844TQb2yIvj6OlpVT8ehxm2ciGNF8J+3xKKXpmKi1yZb
	WR1GNI5xhVY2lriGB1snciNLckJsQTq1IwdG7vk/UnH+rLmjTNR1L+tMIt/szDBynoNDmT6FJK0
	4Wtxhm/b5xyzGQ1/JH9GV5yp+vU0tdg/hrCpkQ==
X-Received: by 2002:a05:6402:35cd:b0:663:8be1:3649 with SMTP id
 4fb4d7f45d1cf-663ba9b776dmr1936388a12.3.1773412090104; Fri, 13 Mar 2026
 07:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-8-dmatlack@google.com>
 <20260226160353.6f3371bc@shazbot.org> <20260303210733.GG972761@nvidia.com>
 <CA+CK2bDADhFcMVGoJew9RoJ-DsVhYhiZJGJVwfzTBZdGX++8Ng@mail.gmail.com> <20260313122525.GB1586734@nvidia.com>
In-Reply-To: <20260313122525.GB1586734@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 13 Mar 2026 10:27:33 -0400
X-Gm-Features: AaiRm524CkK4OBTNvXFWcAvWcl42dW_YCeYpiFYkXzW17TUn9itgLI7yXbb39d4
Message-ID: <CA+CK2bD2ryZsvgono-5Yg0jwwCa-p55wefT=hn3DRsDJVc0ADg@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 8:25=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Mar 12, 2026 at 08:33:27PM -0400, Pasha Tatashin wrote:
>
> > If there are active sessions (incoming or outgoing) with preserved
> > data, how can we safely unregister while they are in-flight? It is a
> > rare condition, but since the user can cause it, they need to be
> > notified that unloading the module right now is not a good idea.
>
> IMHO blow up the kernel or something in the core code, you can't stop
> module unloading once it starts so it is pointless to propogate this

I see, I will send a separate LUO patches to make unregister functions
return void.

Pasha

>
> Jason
