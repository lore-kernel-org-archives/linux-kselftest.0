Received: from mail-vs2-f5.google.com (mail-vs2-f5.google.com [74.125.227.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4886E38B7D2
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219780; cv=pass; b=DNE2+L7TCRxwsJL3yqpi3+NdhFfBaMwGts2dGuRrtc0QGRc3eXf7k8pd6mjgYv/y/hEvqX6m7FZjpw1RgDP1keh+et9vlZrRmKGEH+E3t2mD69Y3soqWbC9a9061PDJ1w4oCAFH4qwo4d2rPMBOvTLht1eAW6T2hb/GgOGqc/Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219780; c=relaxed/simple;
	bh=w65zAE5RQsKUX0xWxN0GNr/Fkyw6HDNWpiItWtCqaS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYuG+dnwlFmDU/c5oNSnQaXUhwP45foTq0mES5HuKRENrMxs8V3guOWw3V/TBXF+25g3jfzfvim1ax8oTKEKlTwGs6WcpziGQx0nFuJ86Q93HFgyyI002CzUcjhUVqUtJiBZv+ym5EKcGGnQQnqLDFjTPa3cBRgHhvldKqjvs+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q49XP/FV; arc=pass smtp.client-ip=74.125.227.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q49XP/FV"
Received: by mail-vs2-f5.google.com with SMTP id ada2fe7eead31-78333cbe5bbso1580569137.1
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 06:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789219778; cv=none;
        d=google.com; s=arc-20260327;
        b=dgOnPRQXQd8bDeZQeWLeNW0fSu7ZMm11XbbNwf4gncK7506zUvMkMQEUoAkuorjk49
         hHjZcbTOj91q3e3w3LRM8p25PaKjmzZYFKXgi6ZaT8FCgP+FPZ+IHtL83cdoGCMpDVvG
         UhGtMKnhFeFmzSfOIupAGYcpyxHqOTfCyg+yi3oBVvQk5eWx7wEGlWaky33cgpv5sJcZ
         HLx+nTCI6HesYnZ/uSenPkcx1usjhKKPU+wN3H03ghWkDp39Ef+I3QyW4R13sGumimHg
         KbVv58WFqbROJ5Y+sYR/EkOf4h4oy8/Tr0NVEXQuhZAH9UoVnR1c8EBs70Aaqpqtk0B+
         ElWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dLw2loIG/Pp0pl9OY2tY1bLAD5HMO+AaOJKL7LkY40=;
        fh=LcSwIPXYC6EWiViNUaEJr2BqL4pcJkAsIdegSvqHC3g=;
        b=FM/C1ymRn07mGOPsxStxjJz+1GBi/OtFcVuC7e8GSqj0TJ3w00U66OV/xq8ys5jl9h
         GhugXw2NQ51tLDZdgKBWllmuONYJBfHkJ8uPZt7jrw9Bb/53RapTNi2L7lvLeajDfPdA
         K5o60Ah9twGc/SeKfSHxJ1lAx9PEGJ9bc02Jwlm3Ruzo7xU8SVXF7zr7H8sKNU5jUq5J
         PHGp3/1W5vwvnlZHrsk76BtfIuTF9FttTc6RfX12T6Qr1U9/S6yJMmO9zhjVbwgifgcs
         3jKXB7puI7dhpOmMJZX1NR3LurYeKJQaSboA0L3J55TeIrGvo0i9zSd/C8Y/5RQSyZKL
         6ztg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219778; x=1789824578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dLw2loIG/Pp0pl9OY2tY1bLAD5HMO+AaOJKL7LkY40=;
        b=q49XP/FVF+TrhmWvlVGouFMAHQgPBggDvmAd1QTfNVGlnzaYVrcKG9rmf0m0S+MUe8
         brDY+m2mtDM1OXrrUcDAFmgeRULl2ZJ7cfzlTINzM3v6rjdci6SUhE/YGQkp4bTIlUck
         s7kaOzuZkumhXR6xnuMD2zsaiWmJ/RHEmvy7n+IYSPM3BGwTc9S7Oo4wb5yaHdo6pnJd
         YX08HstWpijLP29/3hw7GDNn3gR9o/LTYx/wayTMSc/9M3F+igBJJY5Wmrsz00WU9ZQw
         zUymXyW8bRMuv1Oyz92JoJHJW7lkNX9jHorLFbsMShPYRH9WsSCK+cSsHHZIZRql7Asf
         takw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219778; x=1789824578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dLw2loIG/Pp0pl9OY2tY1bLAD5HMO+AaOJKL7LkY40=;
        b=ctMZ5a3tVRxDTyjDsz2iUshyawlTHtgtqBpwm/rKR1cFcvUo6HBgK19fXBx5Ebilii
         7VNQG1KlvSkgd8ZN7P5yCFEY0nHa8OgL3CnEuLIiWDsdxJPI7Yn8Ikz5aNuzAlhhr5Yg
         ZM0v8aBcx+sX7dGAQw6RZXWPTImU/zFCgSrgEEOCCuv/i3HOsDIY6IPjZMbOnxgTqp5Z
         MZM6+nebn3aFDANkN/hfdzlLzcmjw5vFt5KteQYiTj1odz3YKXGbmE3BYqbIlVh3Uf1Z
         CCizLBKK3pYbFBvG9jvIdDdCGuIwmm7ZMkQyoDry2qISrq6ShXmWBn8V7XErXAcxBsSi
         8Oyw==
X-Forwarded-Encrypted: i=1; AKwUvBxgJuKlfQ64y8IM41zyCH8Y8TzmksmGzenUHPVYXbdKzfPpTWJ2v7Yi8WM92MoJd5PKGxDfhoNwBmXEmmNWeq0=@vger.kernel.org
X-Gm-Message-State: AFuF++kky8dHsE5BZq0Y9RALwpqEFgJHZ2GdUECl3cvwmgo1ZEQG8AJz
	Y171nbyzcO2IUBWojMlHDRgsPCmlxQp0vLMalRMxqMxZtvdhH5/OGi1WADma6kKPohSycHb8Kre
	PX+o8kNR3kqf/PmUhCBVvskoX+zqCHX4=
X-Gm-Gg: AYBFou2ioXtyitIlSevkf3BEIc9XuZolJvm/NGPh5C4wrjZg0qL9TaOC9r8pxwRCLhn
	WHCV38M9u576PsAGu/H2y9etuDuJ/GOTRu7kdNmAPVq/lU3/KE+Qkxz5T4MSUUr/E9p8KWo2Gf2
	RlH970ALBRG7e/2LN6x0w4O+ENDoxoQxOgobYXXOfv+gSGx7JieBXIlTyBGKQ2ZN3YawbgTjvaL
	Uhnz9VK1QKQPGhfSexEBBEWLDGc93B8v90ri0qdwfpP3kaD+HJTelKHQW0kCh6s+5X/KYrZDM1O
	vhKt7CdBkmX58t5emuNkLhBmg2ZGqYcOOHDa4CCvEdA/tJlJFzbdPPWKHNkXBNDlDLH8uwAiqqr
	YZoBfXNC0d5d20RUgfAvJBpDR+xjJ06HGh43JxIMmtEAuOw==
X-Received: by 2002:a05:6102:3313:b0:790:235e:4209 with SMTP id
 ada2fe7eead31-792edf64392mr4768111137.12.1789219778089; Sat, 12 Sep 2026
 06:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com> <CC87B3D6-D5BD-42D2-B84C-47745ACAD0AA@nvidia.com>
In-Reply-To: <CC87B3D6-D5BD-42D2-B84C-47745ACAD0AA@nvidia.com>
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Date: Sat, 12 Sep 2026 15:29:26 +0200
X-Gm-Features: AcwNN1Wq5ZTrxV3k1NjhhPK4dlwMKgsnXpdc_cmQ2xjSE7CLbOE09_kryz33d1Y
Message-ID: <CAD+X6aA=0f8mLN0j-h3tqHCRAq_pi4Xp80FUA6GcZVcZa142-g@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: skip khugepaged file tests if mkfs.xfs is unavailable
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 2:06=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> This might be more robust, since it can detect mkfs.xfs and mount failure=
s.
>
>   if grep xfs /proc/filesystems &>/dev/null; then
>       XFS_IMG=3D$(mktemp /tmp/xfs_img_XXXXXX)
>       XFS_DIR=3D$(mktemp -d /tmp/xfs_dir_XXXXXX)
>       truncate -s 314572800 ${XFS_IMG}
>       if mkfs.xfs -q ${XFS_IMG} && mount -t xfs -o loop ${XFS_IMG} ${XFS_=
DIR}; then
>           SPLIT_HUGE_PAGE_TEST_XFS_PATH=3D${XFS_DIR}
>           MOUNTED_XFS=3D1
>       else
>           rmdir ${XFS_DIR}
>           rm -f ${XFS_IMG}
>       fi
>   fi

I'll send v2 with this, adding a Suggested-by: tag and fixing the
Assisted-by: tag format.

Thanks for the review.

Best regards,
Jaeyeon Lee
