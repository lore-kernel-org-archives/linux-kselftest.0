Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2527F18B
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423286; cv=none; b=Wi5zO7/9kHox/Q0ptMn/senpz2Z1cRkogTgZeXPkmcbP4Mis9u7p/41KWKK7dXKNhpSbscQnpo2YcDgJHEInqG1IgKrcy2gqFlNmy2c/rnwCLhrnMeFBH1Uttr1rNjChJFF6BR7JSmde5MPDOdPZFIEPPq8ID7eLoo1GKRESiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423286; c=relaxed/simple;
	bh=z973FCycnB3TujmEEQejW3UZf/uhTwOxCrAga9oobyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/r0srIEXPakTlGVKwGAfzIYuN0wUhAS+rqQ6lnl+52GE8D8PQErKeYNR2/doDA4f87EHkULvCXin8gyLixisFoTxPAiFbpfbgPQbtAnXA6egCOnp5fKDIRQ8IYsF872a05Yz5/03sC7qAUloqBMSUMVTN2y1ASO2UX+jfadyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=glXBATMd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6WSOTqQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="glXBATMd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6WSOTqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774423283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CTBVdjMl0gw9L96tqaRdKumbhrIsABDruk8W4kuVLG0=;
	b=glXBATMd/3QbfAQU/n7vW+eg9HIL9/zLsqnGWaK2duN60HgA2dBXRfnJTBNNOga6f2IfhT
	lr36t0cKi5jeoZNZZvPDM0HWP/8UguNpxRC1/EZdXB1LuGcRZ5/Ns02VTdUInP05IWOY7n
	Cc4OfuCvvvv8KVkJFwnAGiM/0ypKPYw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-Ab2Q3hg6Np2d0LMNNNi0Jw-1; Wed, 25 Mar 2026 03:21:21 -0400
X-MC-Unique: Ab2Q3hg6Np2d0LMNNNi0Jw-1
X-Mimecast-MFC-AGG-ID: Ab2Q3hg6Np2d0LMNNNi0Jw_1774423280
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b060c14ccbso183958475ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774423280; x=1775028080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CTBVdjMl0gw9L96tqaRdKumbhrIsABDruk8W4kuVLG0=;
        b=c6WSOTqQXs2GtnBCt8ReLpDdy0OTLAmQWueNTNtWd1+O03g+WQwGrZTQ0RHq6EuJZQ
         Iq5MC2RNXM9Z12TxE0IVFhuAjJXo/Uzs/SKmSr1ZGbI30CzfwHNKJaUxBHHkEF+oSnhc
         0l9k1lj9krv5si8tAQkYy4A1XUeZCUKmcZ+Ly2yEU/46jti6HgvUp3LAmLVPe/uNTCzI
         bZZiRE0nvI55QrnxxFx0eRnqBRHvH8tlq8O1gZIkrXJNXWuJkPNKUHhz4Gc0xtWN8bsD
         vl3JCorHkxxS4W/mzCpWhr1hfKWfBOzRcGUYslMXUGekMtiN8iKq8el/8GPOK/KAHEBJ
         YWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423280; x=1775028080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTBVdjMl0gw9L96tqaRdKumbhrIsABDruk8W4kuVLG0=;
        b=pOhLAOvx8yr+r1fWr0bJswTGJva2U6eYdH1C8ekrVWyhlyd8Qud/4zmosB0v63FqWQ
         oPxgImX0imS09gP2frThzKHvuki0O8SEK/jtiG/rRbj7YePB6AMrCW7yNaCZOBRhu2Ns
         I5lbP8hQIIcqFT8Jzn5kOv0UWwp2DKyHJEdqFwnoPYZubTIW2PsonXEvYPeMMbihU9XI
         ClFE9hhBFCzZ50mS4ba7TE5CI2UqnWzZGtH+gW9upXahI9Zrabu0kFRiDXbDJfId+p6R
         PyES3zgDXo51wueyNkOeNus2pOtz6xDVH5KDM947gJQMMHUJYUETYZVVVzeXhNpaeB8l
         A53w==
X-Forwarded-Encrypted: i=1; AJvYcCXYgnxH13WmM4/HdD8ZZlhXhSxf+K2VR3wHPbWIPuuUvV5IgdEtynBnprMinzzU1Qyk9ot9f1gWbioJ4JVurKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlVFaAFHjy9/CamYrG42U6u/uVuPZGAbZB+uBRpl8ogbFXlIfN
	osjXxnL51cvXuX8Vn1RQXGO5PY0wQwhZOYHu7/bk6He8lTbDNIVRv7kmdcOY+NLH5bYrHuoo0Wq
	uSKhsoifLleVC6fWWE4dN1G5ullxee70sh9XqdAuf/o7mbEvlsQZGLqAKrCwq8VtT0Z8Z5A==
X-Gm-Gg: ATEYQzxeOtEOqUI4dyGmWgRvfveVAn57D1pW8JBtAM9iFYmc12Cu9DHDTbqLqfh7KHU
	NJmloCCiVzf3kbJ1MLgTQGeCt5SE9m84wzZTiZKGXl6N4VkQQ7kFH8wrbvW9HcRUeUnMDlt/Ch8
	lKgfMWp5DbkqMkjpgJkASAVBRoNm0G/sVVsXYvF5xBKCByTmOV+K1cgEuEFVNV0ohHi6JTOZPnI
	oB5ISaBzgzQowxwXYfHJJQdx8iPXIkVgEKDkZBwBehPi9VtGd3r6/SebdV0BTs2UcgHRQAJZzqS
	BlhzBsSBY+J4p1jMrZJon925II991P0lZcjF0LKClj33j/0KYfiiwDrRJ6P7tP9R0NzwQ6uhyGd
	reOCqw5XJvL7eZqU5xA==
X-Received: by 2002:a17:903:1b28:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0b0b0d6fcmr25894355ad.46.1774423280294;
        Wed, 25 Mar 2026 00:21:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b28:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0b0b0d6fcmr25894045ad.46.1774423279806;
        Wed, 25 Mar 2026 00:21:19 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516908sm210835885ad.1.2026.03.25.00.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:21:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 15:21:17 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, longman@redhat.com,
	yosryahmed@google.com, nphamcs@gmail.com, hannes@cmpxchg.org,
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev,
	tj@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <acOM7duMf-9plHAC@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com>
 <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
 <acKAr0TYzuYPxH4A@redhat.com>
 <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
 <acNH6C6Ay7As4y60@redhat.com>
 <CAO9r8zO2Nq=8dGBuJ0xpQTEr4EM2iJ=WNULtCU5FLLj4a23dYA@mail.gmail.com>
 <acN8tN4FhuoxCxzs@redhat.com>
 <acN-BsPf0OR50sTP@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acN-BsPf0OR50sTP@redhat.com>

On Wed, Mar 25, 2026 at 02:17:42PM +0800, Li Wang wrote:
> > In summary, the problem is that 'zswpwb' does not update when zswap is executed
> > under the zstd algorithm. I'd debugging this issue separately from the kernel side.

Plz ignore above test logs and conclusion.

> I forgot to mention, this issue only observed on systems with a 64K
> pagesize (ppc64le, aarch64). I changed the aarch64 page size to 4K,
> and it passed the test every time.

Well, finally, I think I've found the root cause of the failure of
test_no_invasive_cgroup_shrink.

The test sets up two cgroups:
  wb_group, which is expected to trigger zswap writeback,
  control_group, which should have pages in zswap but must not experience any writeback.

However, the data patterns used for each group are reversed:

wb_group uses allocate_bytes(), which only writes a single byte per page (mem[i] = 'a').
The rest of each page is effectively zero. This data is trivially compressible,
especially by zstd, so the compressed pages easily fit within zswap.max and writeback
is never triggered.

control_group, on the other hand, uses getrandom() to dirty 1/4 of each page, producing
data that is much harder to compress. Ironically, this is the group that does not need
to trigger writeback.

So the test has the hard-to-compress data in the wrong cgroup. The fix is to swap the
allocation patterns: wb_group should use the partially random data to ensure its
compressed pages exceed zswap.max and trigger writeback, while control_group only
needs simple, easily compressible data to occupy zswap.

I have confirmed this when I reverse the two partens and get all passed
on both lzo and zstd.

Will fix in next patch version.

-- 
Regards,
Li Wang

