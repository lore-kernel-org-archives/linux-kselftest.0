Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C654E8E0D
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065806; cv=pass; b=oIFvrwmtouztrUhJsMqlah8SojSmHaPIfjcsVgq6Qbp0GPjM164/0e/LcVEul66xVkj4i92AiSYmHG3GKOrCX5v6FhJ0ImiuiMcUoh/0rJl0c+SsnY0zIBvxQYS8Fis9ZMxIXCSmWkGKwfmXqYl7Cn+oGpJJ6KTF0xKir7c15/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065806; c=relaxed/simple;
	bh=bk0KTXDILaFMtgyu9ZO/AO83ewyYbxEO8u97WNp+eHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1U4ryAG/s58mPIxBGVaz6fho9KnHf2LdCOfF6pt8fiXhRJSe0EVakLmR18JBfE5FKn0wvXS030pPSZ3DHBjhAtUd3NgqdQjIsje8rSyA29Ip4E+mH278yxt6XrWxSJ8a5kbPp8kPhg796bomg2F4FGWBeOqREweIeen6UDHobQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=K2eBQr7S; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="K2eBQr7S"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53582498790so16455001cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 05:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065804; cv=none;
        d=google.com; s=arc-20260327;
        b=Skq6IpM8TPu+cMUit3MCn75gb2/v8mGdiwxTQ0pyh4kCRxVy1wQX0ESi6lPXMDdO2E
         4m/NqIH+hjYduNS4/j/KYCrPSXjyH1DCgzCGXslPQcJ3831/JFlFI5Txht18WwD6a1Fo
         s3RJdS+hUNsT6hjhz/dbfaNoeuUx3QV6NN3TirIUgLci1HkgRJJKN7b7w5of+PZGyucK
         anemaESqTiq+3vIjrX29FouhosMa0BTF+Gi4incjNinbg+4gMe5IKaJ3ke8rJRabnbEf
         lUO9um9ymQFOmrQao+nDzz+LdlDXlD9AnBEag2BX/8xMXg7jLBkBSpZgKVbLsu0+Nxil
         xqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        fh=YFDPJn63hpeXWTcfqFd7jvet/Dop3qYlLRJL2/cG/Nw=;
        b=c6t3O26BshEaeQ1U4BuJdB0oqJrUHYTTu0UO7FL6bslQNnHPBLTcO5rsIS/KTo+t4W
         6RBNftZu9iosmf0OgJgiaSbhSjNjD8yciyeqqdB0tsILVNeZPTvwDk+Of4cnsZ812WC3
         qRiXfKC//Z4i1RL7jPZnZPPwTaFif0QHbA+QQy8iK2BHpYXpjH/gGz4VSRaa5gdZGDsP
         SSbGYDjcSho87vem0d7QSigBnA/0MW+bkVVzEDXvK7VxgrPAs/ha+0GF0rf9WhFRJ0kt
         VebAublppmTjWlau+sm18xpC73MSbabNfBFG2NtFjwN9lVpe6dBM9RMw65dzUey+xZLa
         LP6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792065804; x=1792670604; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        b=K2eBQr7SRNqAbtcfY9Zv5mmw4qik1RxcfL8lCQmb0sQUmc+r30EoKF+95hi81XXcqa
         rV2tmXo4UNH4ngbHu8WZw4h4cldqsCnZpjJZjwFxe6OwXec2Il5h30NSFUEUHZUV+xQy
         eVn+03VFvJGftnoZF2WqY9lu5yQMlbbQdhMPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065804; x=1792670604;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        b=2eg5Yj7aVkVvwgn7t8WwynheNieAL0Pm/3HW3LkCh/1m3U1YbyRTCq5sAUqId+toSe
         9P7mUc/RHPjf6WtoRqAYaPpFglhqb/D7YwrL6o+VrgXLwXXKdzlCrNa+lMmiwPM/IyJw
         aD1GUZ/hlL+z2E1TPb6iaVtG8bGpc0bPgtA+850BnIhjPo5ejmjv4vcmt9yTFVBOIYxS
         28VOFxIHagvNP5l+bd8LVdluuW7wssOlWi+7s3u4OUaCjM6KW7N0jl5bo4IJwOESaC+d
         Welbl00431ve4RznUZDOE942+WpRiO5YWK6F43AhlwDidAvNl7OLzNEFIkuORyZdoKnI
         7hCg==
X-Forwarded-Encrypted: i=1; AKwUvByUDi+p+9e05V9WjwPjKOrDAdk3Y4iH9yg3GHzbCYZ+MUfJKFvThOsCBLDuQfwFP0pTrxI4r6BI2ceAL27XUoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYISoWLPwZ1GJK/ikotvpeucpwNpKNbGhTrVjoIhRD0lwNxJzfhU
	y2kXjCn+uYWKMs3FtM1nys66bH5IoifILwE6h97L7a7kSO1EJBWv3IxFSL/2ckiXHHDFOTw4bfy
	wJuAn8kJcFdZlbVyxDtIaeNPeZtCi5pACLJVu5vrSfQ==
X-Gm-Gg: AYBFou2Qx37ggUl0K1V9Yyy95Jo/icLst6xxX3FuhHCYWYah0ByyLXLc1ak7oHTrTSm
	plSY+eV5RQL0B6E7WVkJBl5Ux6Czwt2m9MGafdd2tLZAKc7Yfvmz1rOCK6f9xHja5eQFYlJbcCI
	0c4/xRUW6W0uGWfP89/pgoRDvW3ZFarI1pGVYY2yDZ5Xt8arrM7G3z1KDOjhtdW2S0nNT9vwUtG
	B58EZdm869ABLNJMhCH8X7LRsF1+LHiC5CISIIwr/2WevpnZhKURcDC5voLSgCGcSaggGZQZ6YN
	suyt8fUceM9c8JTFBIAPE+2ZvwdcOO5Gh3Zy59jEisRht//m7svF//lRG3DVjzsFeAyey1lRIXx
	xj4RB/lZ7j9IuLZYJcw==
X-Received: by 2002:a05:622a:48e:b0:535:a5fb:67fa with SMTP id
 d75a77b69052e-535a5fb84aamr281517071cf.70.1792065802884; Thu, 15 Oct 2026
 05:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001164916.15311-1-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 14:03:10 +0200
X-Gm-Features: AclHuK8MiHyjueHnKnwHtYPGKuj_TddwwVafZUys_JcMsu0_shaAG05CNojzKZI
Message-ID: <CAJfpegsFZ=K09Kzr9Eec0sQR9gzxVHi=PDyQJs_bOKvfwGiU6g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/8] fuse: caches documentation and testing
To: Luis Henriques <luis@igalia.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 18:48, Luis Henriques <luis@igalia.com> wrote:
>
> Hi!
>
> Following this email, I'm sending v5 of this patchset.  Here's what changed
> since v4 (mostly from Amir's review):
>
> - Included suggested changes to the document
> - Moved back 'struct fuse_common_ctx' into tests FIXTURE
> - Fixed a few typos in the tests comments
> - Added missing SPDX-License-Identifier tag to fuse_common.h
> - Added an initial stab on the dentries cache (hence not adding Amir's
>   'Reviewed-by' tag in the first patch)

Applied, thanks.

Miklos
