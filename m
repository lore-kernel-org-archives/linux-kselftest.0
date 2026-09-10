Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2413CD8B0
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.197
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035911; cv=pass; b=NOjUNrGogGQaqXewAPuK3bTeKYT9eafA4sngCvcoMmw+sAncc4YHTt/JzvhEXNd6CMtYbEXNfnIn6mZUBnLw3UgVruQSb77L54wxI0NilKhzRQDpJSNCpoMupaor1W+zc/sLp4Ui+fsmGDq5+OUl2LvqnIPhhoo0pY0hvdfr1b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035911; c=relaxed/simple;
	bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeohD030+VLMb6HVEKgWsTuWjNLUGXYKtkQqBQVfsyWFxz2k0DIfAh1Ffm5lv7exPMTpxsw9D8okZ3USUR21lQXarVbJQMCPpzJSLXTM3RY1ZZJikJhcwfdPNl9/avJPdA8rCcE/AOdTxgorwDoF/M23qD0yZJY78rSEUXLxGW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anUyL9X4; arc=pass smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anUyL9X4"
Received: by mail-qk2-f5.google.com with SMTP id d75a77b69052e-52ff498cf90so44937851cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 03:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789035902; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYE+drLMM3VFRAO1S7CPhuAC5CF9kaTOcH597VN2K12yil5ZdG4LuFX8xpjortxDSw
         AJAXD99hIc3N/FUQV2cETVEx/y2VvTazw2lPoTEFiZMMXooZSyYZG0Q5jf/iFnH3AYSe
         TpQve66png0QvOT8aY7EGp+H1VS7XM8tUPqV/ewZjXR1qU6x9F5FaPh+zz+fyVEdt524
         ajFAj4QVQz3YeUX2qeKrOM4ZUekHDtEeXjnzynzAOqZ37QtMMxIBp9Ey3qR2Pty17d5e
         1Ww+cTjIox2u0VaQp3dNuGNmS0IT4tTUrqPAoTaY8xJHmC2MUVRHbodez97EMhjapW4f
         iPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
        fh=0tJBh75BuN+Co7AmHWF4CxWGti2d1A2XvCba2dKMFyM=;
        b=ceyPCPbrzbp7WmbPo7uDtb6GLUn5Z2M2OToH02Ne0GSzcjFneIAWKDoTJZX7NS3yus
         JPElVThSKXczMDcM/LFYJXDepdv6gPKXu5xwO7bW8YAQZTg5OWRlMiDFpgojp/LFD+0L
         ZIjezaufKGBFMQ1Clhujzy3yU3L7H4jgOvpPTzZLT9boCSlEPSy+fDFcoM6rN2VFc95y
         Vtx3JH8GZabPnSfUjWMGMhnBNTBcy09xOn69jC/oiVcT5v27FYcdYThw0g4xyymjz1dP
         0n/uGmUWA8kBpoBMDXLvni6f7duEoXSAaYHoyvYoNk3+HlqAt+CAxXxf1Vj2QbMwg3Ul
         mt6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789035902; x=1789640702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
        b=anUyL9X4frEDQW6T8L8oMc/S842dBiDqOopxZQptUDW8DWdrFbvj+3YNdhbzICGQ9h
         kRpTC403AQ13GBVmxhRTuKQwis145LD08UwUd2yMY12MFrJiBDnzqTSjdAmr5nU/sP5S
         P9UE60Z+vSKccn3npX7/4ppXQ63qNSEZCBQv9bIBffWdw7v9XIoYDp70YBq240PSyMeN
         K7r5NhKciFwLJucQfjqS08S4vBoRqxoGmTM3BeH1FZOYju+NGz7m95k1FYDba3e/F85G
         gIpdKzgX7lBwnHl3WOWmpDg/U6ariDrl7M5jCqJ2zFE/MkuYDjhGchQftvc+2GnnMPqQ
         V3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035902; x=1789640702;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
        b=UY+MrcOMP433vU4Ab/Yos0k4Sp2j/bYjKERDym3OmIMVqj0H08JB8RtAdK5TXc11ec
         iVseQWkJHXBOIBUJUw4R+I+MYGe/kZHsnK30qtDWRO1yjnHvnh9976fnrgb5XgXcgCGF
         eVS5zocmI1GLeX/tHFW5VD23EzWDT02Qta87wNp01P/f4gpiOjIodz7tVjuhfCuv3LRA
         b8shq+nNyJ5Fjhize0RqSEWGO2f6pcDVa1F4P8b59Fh4qIdnZyC8abUYrwyVnSNHAl+g
         +ucN0FjQzE1g2A/s07AGUysLy6D3T1awJwmPLY8JK3U9SaIjVNXU5NwjGBhtl3/w2znt
         iqiA==
X-Forwarded-Encrypted: i=1; AKwUvByMnJX1HdSGBupTTtDh3COLFJNpidGjZUTeagq7jfN9d9cT/sVpb13qJV+b5yv0F38f0kKCJsooLf2pglpw304=@vger.kernel.org
X-Gm-Message-State: AFuF++mNSbly3l/VMU/RosePQaqHxkYo00YBpZzyxpZqJH8rz8bjLOfz
	2yIlJpfb3GbtbI5XF3+eHlSbDvgUIO/9Z9HUaEiQO7EyU+pP/WFJNlDblddqQNBDYK6ieizjlSP
	D2tursS1aAKzOjzm3YOpMqBtXUELoftI=
X-Gm-Gg: AYBFou2doC52QotHlEFjldxlvjRp+sXvyGzHqWP0MdZe/o7C9KnYG2InfV6RbOLmo0K
	KSCjHPtyy0ikq0iKLj5THt2zRM6BpitPjPAIyOtBk+eR3G/NiFyfi6pqSMnG6uc2GgRMCf/woWY
	dd9BYwED93dxpX9FUCHpunjXGT0x+4k9u+I5EVGJsr1o0VpdfNrTJSCRlZ0Bn9548g1oytgykF0
	cL26sB6gPKtFzQqGa3wH4pvn2MRt/n3taUwwpKuJWXNm7z4tABeKKvNgKWGOEcjuLLqfLv7EZWC
	kDyB/Knph4e+pWlR4xvAevaEGAEJ/Ohw4benCo16nFrQJXDetZ/ZaA==
X-Received: by 2002:a05:6214:c6c:b0:90e:978e:1c5 with SMTP id
 6a1803df08f44-910d0cd306dmr100407746d6.16.1789035902071; Thu, 10 Sep 2026
 03:25:02 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 10 Sep 2026 03:25:00 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 10 Sep 2026 03:25:00 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <17f49997-2bca-4e1e-8d58-bc95e25b9a23@kernel.org>
References: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
 <CACGbirSjNMD1mijDWRp4gLcw-6dJsErrF_jgjwr3nO-geBb1Sw@mail.gmail.com> <17f49997-2bca-4e1e-8d58-bc95e25b9a23@kernel.org>
Date: Thu, 10 Sep 2026 03:25:00 -0700
X-Gm-Features: AcwNN1U1KzJJqcIpSm1ihT2K_s37DAftiuJeICzH9uiCZ0P912OBUId5Syhekfg
Message-ID: <CACGbirSm=AZtAVwJAZRZt0JAGGUGVOCUQVqu-EcEiiGC-=+vJA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 1/2] selftests/mm: Reject invalid test
 selections before running tests
To: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

> How did you send out the previous revision? Through b4 or git send-mail?

The v3 sent from hi@tychen.cc on September 8 used git send-email via
SpaceMail SMTP. The inline Gmail resend on September 9 used Codex's
Gmail connector. The patches were generated with git format-patch.

The Gmail Sent copy was intact, but the copy received outside Gmail
had wrapped diff headers and altered whitespace. The attachments were
a workaround for that sending path. I agree they are inconvenient for
review.

Thanks,
Tianyi
