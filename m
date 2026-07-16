Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B337CD53
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219892; cv=none; b=BaGQ8P99NZyiheB4tSvBHghFNG9jplUiihVWzuZn1mS+d69wvfniBz1pqXAv4AbMw7dvLCoJeRFxWgSfWamJifQW82iRj04zeFaK952G9xo5loQty7mdVAEy9flNnVQ8YAFX5FdaNZOR5wUVEIi70mW/QPHXV8/m97VEw3Fx91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219892; c=relaxed/simple;
	bh=3abA9p5dw6hH5BGxr52Cs/3HjcxNfhxyZYCKG2SvU6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSCk9Dd1r0RtRsm56JtET1H0MkcAZW5u3Cgv9nqkMCk5x7AW/aU7V/QVC5c1nuSxIdJwY5+ydZLPcCtUNEsqve5n0AGB0d10BMG0kfyVLxSw6cfZycevh5V+vOCGheAmRwjxuJTignePp+9GQaUu3BOJoybZ8YJrtioEUPRC2WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf3c9USx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf3c9USx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2211621a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219879; x=1784824679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
        b=Jf3c9USxOSBum5mf7jjWFWh0SuuwxU3imgB2uoLinknC2kVBh8MeefDzJ/ppkLlYt+
         9DXZ4T+yGFkas/rQx57QHcUCU0/bPE0a0emceUFSG97ugF4ZhmcnhcVf4JmxoFXTUQ6q
         +ZqLpTdPMa+dfBU6bauTNybl+RKe604f0vM2VH0k76TiSgEx2mwWbtPSiPqu5jJv7iax
         yuV3LtNHjBi6k9yxippBXw3Rp7uJ0zINh4DDaH/SNBWXT33AgOgdYW9LafqRi7CmDj3S
         Keo1+BeJwyrDUT4Sq4IylkBVE7lPcbDnv4TsB7LGQcuZ8EkPRi4iu2FlZQlgDGawid+6
         e2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219879; x=1784824679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
        b=eB5KVFAeh2Y0saot/qdvwjc1s1Pg+sbzY/a9otaF/CBeAszjVrm90F6+Eowe6AzMm4
         nqJwM9o2wEbEbM5pLVJ4jaGHUKbgDxSm/n/SvrFet2tFccbgFQCZ0nbam7TaXVfW8hmz
         egJUFibHxn14INGWJag2uITnVDcWlZK1TQW3dstDuKqgKou9tE5NBU+ZRYn9Je72Ckx3
         T5MX4R7g9ohUarIGoPOSilKDu5Evt8bVRB1K75ORXbBWtGiIHjghPp7vqjcdtHjXsgq3
         s6J5hkscUsgVhQjJx+o7pHcA97cfboGUyZJXfNcjSvT1meTUmaUj3Q5GkOGs5XkO0PPX
         xM/g==
X-Forwarded-Encrypted: i=1; AHgh+Rqrw34c5tawyyBcLmjgaE4y/wVvPBYPRSbiTvDhrn/AIbvevOpwd8c8MHrWicqetRrIIXJCT8BhEfoG8yz9l9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xS0Zu6Xj5/chUCGxRh0xDvevQUPSYJ0HWUR76ypDjkUuxVZU
	s4UsexXQ8ILexqB5VDFLP0KeoZi3TkyXLNn44O1e5rU2YK9IqXUWkNzv
X-Gm-Gg: AfdE7cnkgjFl9PpemLwlTCs5CnXpb0GM3huD36CD8pJ2ogm1SojLUB9iffADs79tuV3
	F7hGcHIS3dQyLg1+mcVPx7pvvMXpb8YS/beM7qratdCFf10MVwu0FGi8hP8y0vA/A8WwAeZVUc8
	27RcfprCXIeh5kXmfHDYhCO8XnQ4ZMiETO8aX8o8Q7q/zdUOCCRrnW3niOkYl+9mWRtQLkBWmdC
	jw01753f8kJV72jyUUnm6QEJe6RKvUGIXfnOz+9nh1Ziinmy05yA4/sCwwnec8M/MzqC3xb3kha
	X03tX3e+7TywT+lE5EyOpPjmdi8Z6XQutavIgw+yeaBJKq4Y5GZZskNU+QPsuGvgDiN2HaZ+Q0T
	auTt/Ov7kamED/S22WKwY+NaIDRXwTseZ8ToFWNwPbewkuWKmUYuqXRUxLheeaEtlG4BMSHAkSe
	aZJC7blwbLX8NuyaMDtmHf1Tti831okjjsfGo1ALyOxHB3
X-Received: by 2002:a05:6a21:e081:b0:3c3:7f8f:88cc with SMTP id adf61e73a8af0-3c37f8f9302mr5411998637.46.1784219879218;
        Thu, 16 Jul 2026 09:37:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ff4402sm2078703a12.25.2026.07.16.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:37:58 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:37:56 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, airlied@gmail.com,
	akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org,
	jgg@ziepe.ca, kees@kernel.org, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <alkI5JLYPW211Ep7@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <alet21wLwM6P_Km2@lucifer>
 <ale3ydkx1xt6ruuP@skinsburskii>
 <20260715101432.99957d2d33203fafe4af2e1c@linux-foundation.org>
 <e9d0ade4-cf87-4e8d-90ec-50ddb5249b24@kernel.org>
 <aligdOKNwoOtD4io@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aligdOKNwoOtD4io@lucifer>

On Thu, Jul 16, 2026 at 10:12:56AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Jul 16, 2026 at 10:59:56AM +0200, David Hildenbrand (Arm) wrote:
> > On 7/15/26 19:14, Andrew Morton wrote:
> > > On Wed, 15 Jul 2026 09:39:37 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > >
> > >>>
> > >>> Please don't do this, this is completely impossible to track for review :)
> > >>>
> > >>> mm review is currently very difficult based on volumes, it'll become impossible
> > >>> to manage if people sound fragments of series.
> > >>>
> > >>> Please just resend the whole thing at this point.
> > >>>
> > >>
> > >> Well, I followed the guidance provided by Andrew, and I believe he
> > >> applied all of the changes, including these, to the `mm` tree.
> > >>
> > >> Do you still want me to send v9 under these circumstances?
> > >
> > > Sure, if that's what reviewers prefer.
> > >
> > > This is a bit unfriendly to people who have already reviewed the code.
> > > Which is one of the reasons why I respond to a new version with a
> > > single diff showing reviewers (and the author, and myself) what changed
> > > since the previous version.
> >
> > As much as I dislike fixup patches, I tolerate them in reply to the existing series.
> >
> > But having some random fixup series is just crazy, really.
> >
> > --
> > Cheers,
> >
> > David
> 
> Yes.
> 
> Stanislav - also see Jason's suggestion - if you give a base commit then sashiko
> seems to work better. Maybe look at using b4 which does all of this for you
> automatically?
> 

Sure. Thank you all for the suggestions. I'll use b4 next time.

Thanks,
Stanislav

> Thanks, Lorenzo
