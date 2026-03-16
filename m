Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167235F5FE
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700237; cv=pass; b=OS016PJQKWEeKjPgVpofkWniTgl0EEak52Bk34PMcX66HUU8gHbecZXCCj65yL2vSyO5xHgFR6tJIiiPCeGAwdna8y4Hih2wtsoYPYPgM758tCz+wztluFa/sSvSsEXn832eNJ4r96mkESv5d0GTszxkJ/UqKBR3Z7ULzQdgXFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700237; c=relaxed/simple;
	bh=zOX//qQWt0hksu4DcPXbpgchK0aDuV0IDH++kKVCMlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqD9zH496IU/QpNTux5Aw2iuCixp5awUDjgPs4CwTT/BBpksLFnQ01bgVnj1muuW4v7IIVsZKSC9zbWGJC2qZfWKubO8aUCOx5O2Rr+uNZIWwO4sWsDmeBkwxbhyfBAXCWiYN/5dAHjly43JuUA2Ac2ccB6KIAZ/edkWf0aFYHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8OUYxBX; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8OUYxBX"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e4a04f059so5193005e87.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 15:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773700232; cv=none;
        d=google.com; s=arc-20240605;
        b=TBcBo3GgXrlLDWSxrzmX4FVD+njWdlw2WvwAEROA5wKQ3+qZWmUpCC8KRR7j05Pwjo
         IiYLdw28lhVNPGoRcb7AnZYTXpa9+6ffyU6QxfQIxZ/1xc7EpeJzpobcKiy0/1s2CbEP
         sYYnVbL4y/GXx9lVVZWnBgkX37F7e0fhrNx9A16IlEo0Y+acSSxBwG5fam9YPBYJVIAN
         UhqQCGfI3GaV1LRp2N2ZdDPRbjvHYHC3vaU3HjjCATvOqFT797n+ANWGV5ooCw0ThZ7P
         ngcxOR1KgDuNgXzVwwKKTtcf0UVFBBrYLaxN1QyRTcFBbQe0Ip6ZPfUM/34tHAr9cmKt
         MC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NHBApg3dIEw9R1t5Yh73owWQt2Uh584izEOKgKc7ZzQ=;
        fh=VeI83Ar8VzXonA6R7aoT7owCP6lfE2yJwzTjDH6CJ3s=;
        b=hRRN/QrF012qIcASzt0myttQ5rRfFK6lfY08T9xOnIXuuemGr7saFBnlbmcLsanJgt
         SIOjiaV/+/R/VLNqisDtayG9cqfKbAWt6+oQodXX37PikLBoEJT8aLuQmufQJnAFcDAk
         Em7fWE6lGL36SdGX+jvQq67O1Ma78C3GTOkZdo6KfKghcQTdn/FRYUhHO6K5622F6+A8
         4L/Eh4jBMXE3CB4jG+Ct/SiLcJAkX1r1UjvRq4r8TormqCsYIEA1LcROoP0u9gpY2iBg
         dz61KRqoeC1PTSnL0AS1aARHwz7B7yamZ9wPOgFGZZ5vF7KX6rHNw4hxe2c/JmoXy30q
         yXYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773700232; x=1774305032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHBApg3dIEw9R1t5Yh73owWQt2Uh584izEOKgKc7ZzQ=;
        b=S8OUYxBXmFk+Y6amRZJ5f8g9oCUwoPge4lKp/bnqvsLpQu4TaBiY9YxmtvXAIPuwjQ
         vDaB5OERJhvwosImf1/dH1iHawVRNvO4e4jpO5ljBAIEiC0pxx5N5mOW4Ux+VN1rbT4I
         P/JY421qxcrNmXeReYWij9KJEL52vJALlXy80BOqjS/5RHl9Fu2GxuBnU2vGRUdIUBJo
         yDs43NE+RgmvVvitTglEHogh2VDT+QHcFABoCjX35EZhVkuGPxkqksZRGGlG5KrPumYN
         c8YtYpZhgEjhK3jFJnBCgoTLKfv4Gnj+bqiS+FubXg56kABqYwsNvpdy2QvDEKD/D96U
         UETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700232; x=1774305032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NHBApg3dIEw9R1t5Yh73owWQt2Uh584izEOKgKc7ZzQ=;
        b=LiHvpEfVj2832MbenoGdqdbcjTyD7pD9DpPWpkF6UWte44TLS8sn1q6WSJocXXAaMZ
         vaNp4BhA5ufSyb/R6UkKtyQC88ovQvnEy89slDeVove392z+tM2hdwKdbKkZhznfPIQ4
         brhKjmCSfkYdDmXcy3jSVxYdU0mckJ0tlQYuUABdIkpyKMms7NG0jbFxLsY/gnMurY7b
         mWsTo5HfF+4ZfRNE4cfW77GAEpYn13vIBbHP+5LDg69EtgV2betS8G/9SUvLKKPnbJYt
         AkyHVBL0dRc03sFsPyKFdlVLzSbkWA2tX+Rv7fmrSLxVvwfRqPhSEQCFogIPQON4lLyg
         6aUw==
X-Forwarded-Encrypted: i=1; AJvYcCVjHUATq+M34LLSqcjn6QpWU8HbnAeJYrVFw7N5qzyNQwPn7mBwKph2bd/TEQraXzy0DD7MUC/kezjf6iOrK7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YylIQ7gAIDsjqZrx9iiNa20oFS9ISlZwCvexo60BslBYdtI7MDD
	9jpNZY5c/ZGHaZ+s4x6YHFdPFKIyPXzX1+d6VMxMRIPbzTA1H77N7ylOe4JjLWBoQ9Qve0hQcUB
	+cuY/mhqWH6q4HcDD3FoGUWADN0zQsKFeZHmaL6mk
X-Gm-Gg: ATEYQzwfZBDkpUdSjQp3a6lwcakQR8ih1o748gFjozoQX3WAczQcrXjwt7phcUVd4Xb
	lRoTfgEcOCM90jP/bZhohBiQl68xIysV/JFs3c++LUZAVEvwhQUbZwgC3//jp/zj2tO6rSFC8rJ
	qNhyde5io5cpep1Wq1lZ2ht/Jv1TsOb0OFe0mMo+iZH4zJ3Rz5VNVpSbMHTXkop6IaqA5YwxIjt
	GzyqGZucZxcctJgdUm+rOb9rqI99BLRPI/2Tnsmg4VBA0+BwHbVItp0jz36OMkM6Y+gLEmP0lFR
	BKvhcp6c1K7mn0xo4KA=
X-Received: by 2002:a05:6512:38a4:b0:5a1:2a64:202a with SMTP id
 2adb3069b0e04-5a162706bf5mr4418611e87.18.1773700231818; Mon, 16 Mar 2026
 15:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-12-dmatlack@google.com>
 <20260316215056.GC1846904.vipinsh@google.com>
In-Reply-To: <20260316215056.GC1846904.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 15:30:04 -0700
X-Gm-Features: AaiRm51TsPFqmaxXeg5vtHycDWCNAMtrDhfsa1Ts3dgQ-gFDNbzitmE0jWYnMy4
Message-ID: <CALzav=eKbTiJYz4mCWTmVghnwFLHZOY096Pf=1GYpO_UBixozA@mail.gmail.com>
Subject: Re: [PATCH v2 11/22] docs: liveupdate: Document VFIO device file preservation
To: Vipin Sharma <vipinsh@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:55=E2=80=AFPM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Jan 29, 2026 at 09:24:58PM +0000, David Matlack wrote:
> > Add documentation for preserving VFIO device files across a Live Update=
,
> > as well as some generic file preservation documentation. This
> > documentation will be extended in the future as new types of files are
> > supported and new dependency/ordering requirements are added.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  Documentation/userspace-api/liveupdate.rst | 144 +++++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation=
/userspace-api/liveupdate.rst
> > index 41c0473e4f16..dbf1e4aeddd7 100644
> > --- a/Documentation/userspace-api/liveupdate.rst
> > +++ b/Documentation/userspace-api/liveupdate.rst
> > @@ -14,6 +14,150 @@ ioctl uAPI
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  .. kernel-doc:: include/uapi/linux/liveupdate.h
> >
> > +File Preservation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Should we use the existing way where documentation is written in code
> files and referenced here? Maybe luo_file.c for this?

Good idea. I will look into that. It would be nice to also have this
documentation in the code.
