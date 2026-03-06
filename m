Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628338B7C8
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799088; cv=none; b=bEVmZExxLRikOeJ1mG6F6wkixdmS8BeSWIzor5WHy4PmJ/St4wBXkbhkTXigf93duEB4llcFxnqOHRZJzE/lckaIbuXvAutGNRv2W8wOiRFUxmnfi4xrov4WS1ZDDW2dp3cEFmvCoQu7yfOQGjwL1CcCKIVf8Lmd2jLXtQk5e6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799088; c=relaxed/simple;
	bh=7H2AvTqAd7H8QnR4PrOuXAEIsyLIGRg9AQOZdQt4mOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbfhVtdHj44g14xHItUDGF+G1mrYSt4Ncpc3+AsUppcSj7RYS66W4MLrqhi+EMzItsX/1Ornom3pWMkjO1ix9P0F4SxPD6fd7bAa6Tibxoh551NDKB7P50BmHaTBdy4olbqAaSjtUes+ZTtE5aUBQDgousHlXG9zfUN0lDsXmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRicpND1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRicpND1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae8177446fso4803135ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772799087; x=1773403887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p1+VYCqFSNiByaSaiXPiM6cBehayAyLVjnULInN33Ug=;
        b=XRicpND1kEvLeLzvCQh/AfDxQ7JA0Vy5qGGO8bXde5e0rpU/1Dcn9f3xbvWH8D/gP0
         usbXqEga+/Yzd7rDzZZ31W9BZI29glWH8Stx2QAP2H714Zzni9P2SR2UX5/FNcXUJDOW
         44BYbNTJ+D8vWYLNRiDu5v9/p638VSTPAI730raShx7EO9N4DMNX1IWCf+Tk6Q9C8qbM
         nmpzXhw/Wr3rR1p6ad//oDwCkmASxnAxLxTn8zjjiBOn2Ue7fqCAGQ6k77ekSKDE/edA
         H64e4DeBLhm3u7DEnmU5ZfzbNaySKDx4RzJqIgt2xg4avX7UkWW2LCHutgj5WfMHMZuG
         zSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799087; x=1773403887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1+VYCqFSNiByaSaiXPiM6cBehayAyLVjnULInN33Ug=;
        b=BjmmMAA/fS/uGTeP+vSwvXPl6mUF8bs6QhsFq6N5nVLRk4oPE7ZT3MLDMDCIhd6ICu
         nUUBTkkZlYQFPF7riJwX7jAJ6Eroon7Du4pJ45HYvNFuG+YD5DymCmheFEH8uk+LALyV
         hF/seRmzbcUmFAskrB/kwYiSFlbdVkEX1AcfePt132+/mcS1p+66Q2E6ALbArwHy3rtw
         uzs3XQd8w8TTwTS6SYQ2jmXViuHn7kHvxofhv5vhpwZQ6ob0zZ8mVY+iNLkcKs2q8zF+
         89gXKk2hc/Z/XXy4GIbaTsUNeO+JJrfhhPOymV126X85mDzhOTTss3zP3Ptqudnuo9Jo
         Rw5w==
X-Forwarded-Encrypted: i=1; AJvYcCVf6TQwUi7C7r0z+hTXPe5zvykpsg6Rv1yblfFRcLBCppHvc63SnKH8lbA1eT8g5q+bYSU4cQ84stH0Sm8dIMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hAO/9SlXljj7lFNM4EvMpKiDCy3cSw0I5i2XQ6U572r/cIHR
	O4+0iZJvJ4xmG6YFN7lPJMePqMg4clHGlZqOwBrZq8Xp/v2mwtpqp7lO
X-Gm-Gg: ATEYQzyuxYXHCMPXudbna79QLbcmQYtRU3Y+oSCCu5nT0ISW/uGRumscZ/4TFpUcuCF
	s9j4r9G6Dq4H1LZcZUg2gDS1pPhQpPLoFCIhC5RvmSCUGCW4zMV9ArQ6dWhRLvBqdKnkZJXN5ej
	OEvJxM4ObJQFbLKj7xztug/YO4jcb33d9oFmkca5q1SBZwz0THWm92wNKcQBceaYWt6WQW3Xpuf
	yG284OHNkRPzXXABTkerl5iZ/rbUrXqsdq4OQ7kMlRjPRyL0rFk1maAW8lAW334vVw3e/CGQtuq
	glMHFxWB/OUaSOQmuHYRGyyEs/Qf+RpiAsZy0mEvsWkwSoCqSdOrnmoLNlEHTfNxsUohA/DR3Zs
	2DQ8UUSoB1/Ofa+Ls1F52PcVTXKrbbx6ycLQKPNQrEsLuxX1L90vl+Ju/Gk8BzbtYf2QPo5KgNM
	BtREXEJ3r5odWYan/k5PmpQQCo8HumtFFo6vcafT4P21/qMkreo1pgL8JUAOyzXs1VNNpl
X-Received: by 2002:a17:902:f789:b0:2ae:4996:430b with SMTP id d9443c01a7336-2ae824e9d94mr20798785ad.26.1772799086911;
        Fri, 06 Mar 2026 04:11:26 -0800 (PST)
Received: from computer ([2405:201:d015:d26b:3cf6:c501:92b2:25a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e7c58asm19807735ad.25.2026.03.06.04.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:11:26 -0800 (PST)
Date: Fri, 6 Mar 2026 17:41:12 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: andrii@kernel.org, eddyz87@gmail.com, toke@redhat.com
Cc: ast@kernel.org, daniel@iogearbox.net, song@kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix const qualifier warning in
 fexit_bpf2bpf.c
Message-ID: <aarEYMXNzVhvNNMs@computer>
References: <20260305222132.470700-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305222132.470700-1-varunrmallya@gmail.com>

Looks like the CI failed on this:
> CI has tested the following submission:
> Status:     FAILURE
> Name:       [bpf-next] selftests/bpf: Fix const qualifier warning in fexit_bpf2bpf.c
> Patchwork:  https://patchwork.kernel.org/project/netdevbpf/list/?series=1062212&state=*
> Matrix:     https://github.com/kernel-patches/bpf/actions/runs/22741682920
> 
> Failed jobs:
> test_progs_parallel-x86_64-gcc-15: https://github.com/kernel-patches/bpf/actions/runs/22741682920/job/65957069283
> 
>

The CI Failure seems to be unrelated, though:

```
With the provided path, there will be 109 files uploaded

Artifact name is valid!
Root directory input is valid!
Error: The path for one of the files in artifact is not valid:
/packets-135-10-net_timestamping__INET4:_bpf_timestamping-net_timestamping_ns.log.
Contains the following character:  Colon :

Invalid characters include:  Double quote ", Colon :, Less than <, Greater than >,
Vertical bar |, Asterisk *, Question mark ?, Carriage return \r, Line feed \n

The following characters are not allowed in files that are uploaded due to
limitations with certain file systems such as NTFS. To maintain file system
agnostic behavior, these characters are intentionally not allowed to prevent
potential problems with downloads on different file systems.
```
The selftests did pass.

