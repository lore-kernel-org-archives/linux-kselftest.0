Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362384;
	b=WTBp3DIvC5SUHTM9h+bzzPZ/mmj8REogXh8fdDsiKG0XCmkKZXBhLwATPdnNxU9AyX3e
	 tyTgBMl9SLCCeG185xjmdW/xR5l6eOkPUCP1mQ2ZTmM6z5b2JUaqKF+i05DjDFMafjotL
	 8EqvX3/nwxAdfzQhvNSRmH8r0KQYhkTlbFtAaFBBLAb+56Gb7lKDFSjG6vvLa3IF6tlRR
	 /FRrV09q61HTAjKApaL/FUYp8HyIwsEqT7zic2BsTt5H/0Q46dUuXFZ5yCZy19qpzwQRl
	 PHftlXvubvGIRucqcBuxDtcDrqdowRDC3i5dXY7vR8U8xmM5lbswlDvzOc5qXjqNXNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bZKAADSfZoWv8xOE7quCSCjhwlCNy+kog5o59siXEHg=;
	b=RDq+rJhFof6EPAHVhAzgqRsYmocuj2dkxLKU1+wdM5uvmw8GS4js5jQ7tiGkxptRejwA
	 0kQuAMtMeitD5qWOZ8Yt+KO737/lIds9fZsxs+BHqsJI84t80H/1479L85WqmNEYjvaOo
	 5CnTT/k8oidnu5/hguBN5awmaMhaXiGFtVecB2Do+5siOh5Gzo4f2dC6YdgfvJ6rkxhG4
	 mUcJojKgw+Cgd8uq6vqsuBqO/LPy5tGOiTdE5DZr957fpVbbriuJjCBOZgkNObHTQA1LN
	 +tpplMhQ8mzJxQpjUgG3tLvCNI1HRC/1fczgBsFS52r2cdX67PBsepNLk0RVJpRTXwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=D9IrWoMl;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C330606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 12:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C330606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=D9IrWoMl
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c7a0c1617so10473736d6.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793362383; x=1793967183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZKAADSfZoWv8xOE7quCSCjhwlCNy+kog5o59siXEHg=;
        b=D9IrWoMliC4j7FfiOXtcVKJm+6NPKZ6oksqPyUCd5D5T1WgTVWDBvDlmo2f1Z3q3MO
         j1Vc4thT9XcOp6QH+0T2vP9E6ph+l5bTz5lHCAeq7+R1INkmfUuZXpPRY2FpJQ3AhD2S
         QTL1r2v3tqmelcOR9L3xvqtEXpZAdtFGtgQpfER/CI9AknxmZuBRpWcMc/ukm75y5+ZC
         r5GskGgMpUVtHzeigCwLg23KbIb2nAU3pAJ1eKUEPQii/uM+pbTyNkkCWvBSaDAAxlH9
         izMaevRfvvVccHb1YxdklPrs/GIL2ua+YzeTEr1O+BYLatProI3m7/ReKdzkz8XjT78o
         OwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362383; x=1793967183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZKAADSfZoWv8xOE7quCSCjhwlCNy+kog5o59siXEHg=;
        b=MA9alJnqoO3RfwJksSRc/dmQBzhxWQGgfO0sTF+QUEfIPcHSF7vxvlWiVdJCiqQ3tI
         0QLst4Yllf2VEEcKrfXAt1gPHwxOSLyZuieLz10HcXvcidyGq7WfjlRleQThM/QO5AzT
         QRUoAyp6sTlZjRcF6wUl9PyPw/hujPA4APEKVMpPjMXg7VVa55HefGNNez+UD3j9bXkR
         Dzqi2h3CU0/py7OXqKpcJVn1kfCz8Ir3sV2MEUX3IIH1yL5iX8LXRlVsI+pNGPW0m1W+
         H913/9SC+MUBs5tal8yw3NlLu14hp0x1iVn/IWZ2l981ES0cSIqhkvecTxqbV7hhCEBk
         ZFjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkUfZbuHpT8T7FmvhwHKq2wwXMzt14XSttvku9xYiasU4VGVEh+Cd9ThSZMfte2E9j5jMD3pElc17DwEPBguw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2uOSnxMlCyjL7zidRg/t5qiMyWiACULKGxofEnWmOJQmupiig
	m9VP9TKVp8xxAns1OEk3wC+tf7IjMIfILeBoYaYPyGmG7ITbJBmYVL76Ef1CYpmvfpE=
X-Gm-Gg: AYBFou2VKTrydNEKHt5Qbk9A3zSi8aQ1WFnkzRbY/naL8v6WiGguAyko92VZxP7VRtN
	wGTO8iaNOMA2/USp4I0zIFqqUuN5yjzyUA3dAy/5lin6XXZLiZlkZgpy0AGsiTxtzRSPD6SuOu0
	SHsHWn6RdrHsiq9mbs+TfYdXxY7Rxsg3XOSPqZh1AItgy6AlRF2/7v+pP9Zc/Wti117cskHFB5+
	wOrZjyrDDdRZBD7eKVF5j7N8FPdhQyLS7C3HeZYY1AJ4x+so6wd9HxZswOSWiG5auTCH+hBkgQ2
	9nOPA6GhbV3jMObG42MmbRge/lJ5flIYpwNbp2wrVmVL5PN/Jrq7iguL7By33RfhEq0cL3ESiQg
	0GaumdNBqLBxmQCPU/gqLOxCYYMs8ghFDfKHP9yAtPJhVDenarJtG4ocDywH0E0ITtFLRn4ecB8
	Q+CzygzBcPU38rrm3M2ilCCMRsKkPV9vLFIUVUIrqMfKhi1WrfS0QlS/8D80eOqFp2jZZP4/5+K
	BLPjARQo8fjwqtStvo+CnCUc0mE4sx7zlFdHsLyn3I98U4ITHX4T+WnkkIlYsgEN0yzkP3O/Ms1
	48KrEEnANjY69DI9oNwGLms4WQUxABs+d6G6hfTPk6qjui3bFRKkLzXjcQ2kuqUTzB7vCWYTPcF
	9L2h127Xeh6UXyofpXv7ZJ/Kw9gwLlIpq
X-Received: by 2002:a05:6214:1252:b0:917:7d92:6486 with SMTP id 6a1803df08f44-91ca4a0c511mr31768696d6.6.1793362383132;
        Fri, 30 Oct 2026 05:13:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e24001sm13957666d6.3.2026.10.30.05.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:13:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMlTf-00000000Zek-2qdZ;
	Fri, 30 Oct 2026 09:12:59 -0300
Date: Fri, 30 Oct 2026 09:12:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>,
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <20261030121259.GC3889730@ziepe.ca>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
 <auEksxfAi9lHFXmT@google.com>
 <CALCETrXDY2e8x2kdr-FQvFLs-Y7FwNozXGDvqqM6yvVA7QLV3g@mail.gmail.com>
 <auPKfqh_YjRU9Ui3@google.com>
 <CALCETrUEyfvaEGxMHo=c0ia3CDgSxg-YW0_=Z7T31Ou+pvicuQ@mail.gmail.com>
 <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com>

On Thu, Oct 29, 2026 at 07:11:25PM -0700, Andy Lutomirski wrote:

> I can't shake the feeling that the problem here isn't so much that KHO
> + iommofd doesn't like this but that the behavior in question is
> nonsensical.

It has been this way for ages, like David says if userspace shoot
itself in the foot it should not be surprised by this illogical
behavior..

You can get the same nonsenscial thing with just mmap too, you don't
even need a memfd.

Jason
