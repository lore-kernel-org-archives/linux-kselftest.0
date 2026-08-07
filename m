Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B65384CD5
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 21:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786137773; cv=none; b=CvTNPSNws5v2/yxJ/Gailzw3AHliP9X2xH3w3kl7gp72G+jgy8rh+S3qw/B02JF/JVNt9L4yHiIpgjVBznGV1kAhA3fe9FAhrBZTpivHVS61nmOSs4p2ptCroIvgezKywiSssQd68vEvweDGQnPpIbSQXUXYIYbvc/j+MvNzt5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786137773; c=relaxed/simple;
	bh=y6i7cx39WD7HSV+yrKeXcNZ2XryPQykkSj0bXTMcu9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkTBNh+kH37WabVJftRooJeu6IUDNM6hA0+co03odd/FmWieNUTgyVxvjq2GqEp/Yw/L7a6Im3sWe2WWDXBba5YYaFXzgTfKQwG2eM+sFDmooVKBGv8ZnrdR8AcsC7DXIQAu7sXMAurX24G3nL4oVT0X6prJ6C+uISWFbqWCHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/9Eycxp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/9Eycxp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so581485ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786137771; x=1786742571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGhPRnqQkvQ9XTDuFD2lcLHAbRWoNgCOpfXPrXNXFpc=;
        b=U/9Eycxpu4u+Ktpx6DOI8zPQDkoPsYDV3sCmK59RIg+sZ1h1nMM3y4744GurbZ/S2K
         w1HsleTWTEsKxmDtnxTrsjf7XxSZiVckakTvNhMVBA3bJp3sjVvJLnNh55FZJlK8xSrp
         5pE4eWqNshCgMZbMgTp+9x/JrdBNzMIhn8oXp2qYeXvdMSZLeEJFsK9wZzgCkfzN9nT9
         lJwncvh/8C2GRex07rVsBUR3LdFypGfohfJcsLgN9Qks9/yJB5tqjLgwedcPYRG4vb8/
         O6KbUkdkI3DZ9aWpZHj0Kw6Ntwef6JQQrivdiqDMgDrw4wkAJg5f3Yk+Q9w0CYZjUVPF
         Q5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786137771; x=1786742571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wGhPRnqQkvQ9XTDuFD2lcLHAbRWoNgCOpfXPrXNXFpc=;
        b=fPgwIsfczy2OVE/ejWgA/ZsUw8CnviEUKmJC2MugMX3GWC+NaUofnx0mPr8Cot69Xd
         LQ659rl/mCJLBkfcqiw8wvd+a7EAXbUgD9mKsx2xbfaiTqco0Kv7GuzhGrO3yfqKukCW
         1l0WFPc0ZnuEMPw/AAecF2zHDtUj0tLXR9jd26Dh4UFNeA5+FPWAYyAF3C8JveC1EeS5
         NuUaKNQek631QG7wkrtLIaqSMfraHeKL8U/+6OInqQ5ExV6OnOenOKgquIgjD9PcPzJ1
         0lxbqribbD/6jK2ToHkPOafdIR5UULyZujAyVV87i1xYEQH5QT8d1GFo2sgSt+EFYtny
         0Ong==
X-Forwarded-Encrypted: i=1; AHgh+RqUK/U3KtdbtwbZXiUzs9bHEkmCaDmZNDsQwBept7oTJQ0s/zuzjQykDDm6UZraAGMSDK6IxqKlcpW+FGo2Os4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0L8TMMbJC+Syp5IjQkHTj8cp5g972ZoKXc3OsfAp9lAyV+dA
	S8Re5AOvB7X9IEWw2IebfD8j6n1HpTDv86NusfxQYxn87AtYEVA5LLQC
X-Gm-Gg: AR+sD13mpejgnyvKMH2IZVeZeD9h50SfT5xxuYMQJLXrp96cewvdj4DnxQv64ufMmuc
	kzUQb+5VXKlZEHAsELEpMpt6gg1qrByYuhDChVOhcXk+zFCzplmhj7/2Lory+5WkLzy7oYs9Oyd
	fEmtuO8M8pZLZg2vxRjuYuWJmZuCQToGF3mCooAKj9j4DUM0IwzA1LZjEZ5uRUlvgRCVJBytLPL
	9yqu02ibbrLuCerHTAMKTWBz2V06hAj+Uvp9ALJiZnUh5blxdNfLHD2aNdEAqb5Agoqnh0Vfzg4
	oAvsg0y/SZiJN/bXt7RKuL8NBEVpRqrtyqV4S1LpnXeuQdOksjYTA60i01ue4i/yUBi53YbnFEr
	1NyOPIeZsbu4QRIJDtCutkTbzWnbJivoF8IBXsQBrHUHgvCUIa5EWmJhIiWIlz/Q3yj/DCR6Z3e
	mv4N02UHvG2Gt/Inon4LhfyrdoD9wo5wdyytgnU6MPsjAXlnhg/QDWnOIddyJoV0ICwoXdrerxO
	HSdqUD1iIGpSSVpJHgX4Lnf
X-Received: by 2002:a17:902:e5c1:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d294b29499mr79128275ad.3.1786137771208;
        Fri, 07 Aug 2026 14:22:51 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaad6sm13880585ad.51.2026.08.07.14.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:22:50 -0700 (PDT)
Date: Sat, 8 Aug 2026 05:22:41 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <kasong@tencent.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Nico Pache <nico.pache@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] mm: support splitting mappingless swapcache folios
Message-ID: <anZLkwwxHdhM2M2Q@KASONG-MC4>
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
 <590B3189-5B66-4ECB-84CD-7B7EF18C0E54@nvidia.com>
 <anNOroQdjQh7xmU9@KASONG-MC4>
 <DKIRYOJXLIYN.32KI06POZL7SY@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKIRYOJXLIYN.32KI06POZL7SY@nvidia.com>

On Fri, Aug 07, 2026 at 10:18:05AM +0800, Zi Yan wrote:
> On Wed Aug 5, 2026 at 11:54 AM EDT, Kairui Song wrote:
> > On Wed, Aug 05, 2026 at 08:03:33AM +0800, Zi Yan wrote:
> >> On 5 Aug 2026, at 7:18, Shivam Kalra via B4 Relay wrote:
> >> 
> >> > Large shmem folios lose their address-space mapping when they are written
> >> > to swap, but remain valid members of the swap cache. Folios read from swap
> >> > but not yet associated with an anon_vma can have the same mappingless
> >> > swapcache state. folio_check_splittable() currently mistakes both cases for
> >> > truncation and rejects the split with -EBUSY.
> >> >
> >> > Implement the longstanding TODO for this state. Allow mappingless
> >> > swapcache folios to use the existing uniform order-0 swapcache split path,
> >> > while continuing to reject truly truncated folios and unsupported
> >> > higher-order or non-uniform swapcache splits.
> >> 
> >> Thank you for your patches.
> >> 
> >> As Kairui (cc’d) mentioned in [1] (see “A bit more details on this”),
> >> we might not need to implement this split. I will let Kairui to decide
> >> how we should deal with this patchset.
> >> 
> >> [1] https://lore.kernel.org/all/CAMgjq7CHDG8JhesSPMkn1kzG8jKb0BXO756BvxMQC_MCn2eTyA@mail.gmail.com/
> >
> > Thanks for the CC, this is actually not hard to implement as shown by
> > Shivam, I just found the code more and more hard to follow and fragile
> > as we add more logic to it. And we don't have to reject higher order
> > split either which can be seen easily if the code is cleaner.
> >
> > Personally I think doing some cleanup first is better, I haven't post any
> > code as right now there doesn't seem to be much user of this. It will be
> > needed if more clean THP swapcache begin to show up due to things like
> > THP readahead for swap, which isn't here yet. I think I can send an RFC
> > tomorrow just for reference. I'm fine if we prefer to remove that TODO
> > using this smaller change first :)
> 
> Thanks. Can you also help review this patchset? The changes looks good
> to me but I am not sure if I get all the details about swapcache handling.
> 
> -- 
> Best Regards,
> Yan, Zi

Hello,

Thanks for the reminder, I got a bit busy so delayed for a day on that
RFC.

For this series I think it's functionally fine, just the split logic is
a bit complex to follow and we still have restriction on swap cache
for order 0 uniform split only. I'll have a closer look later. Also
let me know how you think about that RFC.
