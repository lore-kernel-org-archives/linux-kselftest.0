Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DE13B6BF1
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 20:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776978; cv=pass; b=R8+kzc9MjLa2MIppGOMvE6AChXptjiTxlmNX3picVktf07fZsGnADEzgg9YNRWh7wWzdckoYZP+a0CtWHxlq8QZD/Q05QHN+L3O5ok5yz+QbLJIs3nSAaliWM7sJ71l2D1skDb0J31rHbeTsFcOk4zg1EPeTkWzkFqxoGqSHiXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776978; c=relaxed/simple;
	bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWp+SKaYLueKurztZMz+WynHDUpnw0C+vAesLUXeXIk7pTVdIE5ICT5wVkvNjA8dcM3kmMRwO6MoHIZW9lMkvoJo92Dmgp7IlWErMJZSMgHB9+oSWbfVh9Z2X+474HRNh4Jjg7ACXaqvUmJk1q8gUhWzBxW2ZIEgWH09zW8RzDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avokEuFk; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avokEuFk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccf2360620so13722195ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 13:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787776977; cv=none;
        d=google.com; s=arc-20260327;
        b=YBcPcdsfiht9j8ZvnB71gtLkyiH7Zz20nQyGbg5zhb+7uNtKnRLqIjI2l5U7duyFve
         6+EO99MNqK0CyVxO6y3RhGSINa0N0Kyea+piSmIUJhjvSKbGjlx5tRsdxhLMXQ4iS1i5
         zVKg/HdobaCXJXeXmoO/jIUEyAJAHaNhPkdkFiYsID0gL6N1+VAX35wt+X9JOSHqYURt
         TeZSEP8Jf29ePBWKlI90QXlG5vTw/yvKUr4J04Uaz9i9e82yjfNgTVitwa0CXPc4c5Eb
         GXEq3GspqJdkBHRLqzRrtXibWXtxzm7qQ/36gTAIgwLWprzGLmfTrJbxxIgSH18G0gar
         lRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
        fh=y+Zspjypseo0qwoAAk2PUuTRQoZU/nhAlMq19vQg/kU=;
        b=ea8xDZaPbnEcvXahQ6qshc/VRWPmVeajl2IPTN+PrIPbtcGX1Jzz+M1OrGS4B+rZGb
         +kav94ws8E0sBwPUlmzWPueezjACiT6won2c7jvRTy0sSbr149+fSx///TzFLi/Cvo6I
         MEmbJUfwxA6oBjAzf6aq0kebalIIixIM0JnC7pBPpzl7cDvgGiGGlYBUeDMHsTd1+I79
         WjuvWESLq5gHGn9/X/PNIBy7Enmb4RPzhMTH9OAedWqn3qF7DNm3NFM0mSo3IIDIF0ki
         7aXxeuf+6iCL+l3hNGDDG2NCOcEf37FlDACYShMteiGURt7LpvoRUIsPM6IaNi2QRtj7
         VgNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787776977; x=1788381777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
        b=avokEuFkcfWeR2lgt93CKutiN3tnprWnMH9N4hArJvSDSgQAj2SF5DcYDhd9Dh5RGk
         cN6U+D26n/47coE4P75lY8raSzTyhGOc+57dAGONrGnNoVamD12N1Fu6/ND7VQ42Sf56
         D2jWH4WRVgrH4tDJygz0SnKSle7XD5DZHjt8nPBI+D2rwbPbWuIgbKQ7zgoPqWo+tOmq
         pGdTlYh8htOncnAtZLTBQcMW7gjPmUzCXMVwkABx0fYzjImwsctRDSETDFPeCb93N67E
         goJ8F6IEZty92jmanozKAQvj2ixf2my7nINzmIv35XYUTeLxl8XxDh9PkhLtlVn2XIuM
         RwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776977; x=1788381777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
        b=BigvNoI3lMFqyGIiELPs+KZjhW/e/690nI48sbGhhvS4ay8FekU2OmslFYRUOK+Wi7
         psTvYhyxgMnt8MjUd8VqQZu1xK02ZJaCkM0t+Rt5tZCSWEZMlwmyBHzFDBos4mT9UjnR
         RASpqRavzSc6/Sssh3LOHnMqQNbF8KLyfCMpfaGE8oNEqkKxqMAGdD8pHpcexvUO3wdQ
         V5HL7aIZiSpVWa5FaGjkMWx7hG/f5i5MOgW3nKBd2K5GTAzF6D6jp6cPqXBnfjYl4H+y
         e0NWQCFZCwUjyKAogMD1qW4k1A40s8S37xbBSb50iwsg3rmwAxy+OjziZBEG4I8qL//P
         2JDg==
X-Forwarded-Encrypted: i=1; AHgh+RrLtI7bRGxvXxuh2vCfwkwazyUNghEqQB4XMsusOCKF1ioCW/9usVaGrIOPSIDb2vC4as+ts3XpDHHWB8RCCTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mcs7njYj7F55sT1ykC9db0vrMp3CNRcgVdAbOCLz8ZoNhnjLWE
	F1xPZrg4PIykI15an0Y2dy+3yekqeyTS3z+rM7/39Tgrf0VHrCR7oIUV35OZgbvyXnWxRxRPOYc
	prU3ehBj3+bCecnZzA/kjT+ZM1KBWssE=
X-Gm-Gg: AR+sD109bQH/UCmzbFncf54ugJ2U5op2w0A2KnMfMOsmeW8cKkBjSWVwrQag8ZjeQDc
	CkHnBCrAnBRqHwxl0V+ucXkw0FCaz7MMjNotzkxIXPJnghv/AE/MkcgzYsvILCsE4G/ifRpt2sk
	EsZROQxnkzC/PIEueUF8+3ZI/bVXRpSZFfvTrDI8xHNBX/+AT74aKDj+SL2gaQQhGwkxOmM0NZT
	5Qm0Sn5/j8q8RaG8WD5ACZqM598MjqRqKnIC9pVhPEtI8krLxdxpwB0K0RWb0OR7yt08WrGDkL0
	+1P6Pm+sD6lk4kANIE14DsOX7DudvnNsneD62K6LQuuUDKJ9cotkJtOjFhFXhNdJteUl9YAGx5z
	xPA==
X-Received: by 2002:a17:903:46c5:b0:2c8:f34c:82c0 with SMTP id
 d9443c01a7336-2d707a5d1b9mr183703255ad.2.1787776976607; Wed, 26 Aug 2026
 13:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826061300.14038-1-anshumantewari123@gmail.com> <cfe22f1a-2ac9-48dc-a2c6-4369e45a852b@kernel.org>
In-Reply-To: <cfe22f1a-2ac9-48dc-a2c6-4369e45a852b@kernel.org>
From: Anshuman Tewari <anshumantewari123@gmail.com>
Date: Thu, 27 Aug 2026 02:12:44 +0530
X-Gm-Features: AcwNN1WRjnb4FrvbNG305N6dcYNUZlWJ5mcojcAGl8FuFaVujFN1h0WcgNdVL4A
Message-ID: <CAJqi8kLqxjX5HjxH6e7seX1Tyb6NhqFReMpCNKR7KTpaFGiszA@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: fix line buffer leak in mremap_test is_range_mapped()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, David =E2=80=94 appreciate the ack.

Anshuman

On Wed, 26 Aug 2026 at 13:08, David Hildenbrand (Arm) <david@kernel.org> wr=
ote:
>
> On 8/26/26 08:13, Anshuman wrote:
> > is_range_mapped() uses getline() to read /proc/self/maps line by
> > line, but never frees the buffer it allocates. Every exit path
> > (parse failure, match found, or reaching EOF) returns without
> > calling free(line), leaking the buffer on each call. The function
> > is called multiple times in this test, so the leak accumulates
> > across calls.
> >
> > Free line before returning.
> >
> > Signed-off-by: Anshuman <anshumantewari123@gmail.com>
> > ---
>
> Looks good, I don't think Fixes is needed (even though called multiple ti=
mes,
> the effective waste should not be relevant on any realistic system).
>
> Thanks!
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> --
> Cheers,
>
> David
