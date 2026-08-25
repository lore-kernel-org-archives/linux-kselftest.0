Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662932D46CE
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663013; cv=pass; b=o8jpDN7TeJEepFA2kGn0Vh1HVNgtUtOpOvUTh36cnCJZRe3vBZbpXtD+eq0hY7to2flcwvIKE+f3wXK0Mf8nhQIxr3wqngsy2BgAb0hKdcVM08+G0JToMhMY3THdoVsqfRMM5p47TY5ncUF+vDpyziHU6nQN9wJilbfW8Vgq26Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663013; c=relaxed/simple;
	bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvI1WrOAUCTZoC3mbzQaHWaN3SP3oZr6RVLY009Na8peLrNRRdmNnSMRL32aiXIi0SLQS0rnUo4aoQMjKEXEIX+filjBre2WvJUePRcv716S1NpTPtudgcYgYl5qTuEwjKz6kiDRiR/POHXAoova0TL1szE6KbyypPbiIp7Qzsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=igfNUx6T; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="igfNUx6T"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52d56b08213so4078771cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 06:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663011; cv=none;
        d=google.com; s=arc-20260327;
        b=APzUvLE47VFOWfsVlbbuXV3lSiWz7HNl+cKjXVk3lFbn/s820ihi2nfJZUohcm1BzF
         w8zz9TBTHTrfChuJf6k0T8YVJ5B1hipD+W+t3hHzJoxYk09YbBrffW3Tk5dnkN6ZJkNm
         gq/2f2oct44UofGoL15EDoTroe/kajosYru2REf3WpPTe845me7Nqs/8B58uSZg2GyZK
         s8gPrhZCAoi6aFpLft7Ri3irp/uWTEa7mWQY62XjSip/u+jk277P6nIAaTpD88ivdDod
         P25gs6ETP81sUDACYJ9DyYSPzdw2kQSCNpvTAzqB0bH3/NdA8Bvk/w20BoaqMrbQoO/4
         NNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
        fh=oHKXyZn8wuuZIVtYnGDJERHzMF/I3EGPTvN0fKoSiN0=;
        b=PJLuFwd1FdtYTCIwwfvr501VbqBaVetdVDOzP49rukdSBRBL8RCR7KsL01KrEj9tIo
         vxpvoZX78jbD8pZ/ja+Bk9/955zDOfOd+t2mHYKPxNlm6dpgTOH3KKFblRoW02rQ0nDb
         IA8zqnTDZ+vmT7nt2BWy4nyYi+qN9ujpfoGSwFGbBDikUIMbIwcwNqGTBeFP4WCY5qRb
         bhoWu96uPkfQxaReK5GJMMG6T/icrluIePZ5w1x3Ll2orvJKvBO2TNL+1jLO7OPm9ZjS
         D22HCaA12MJ1eHGJfwhXXWhbSVV7M8QtjlG6N24ixQMyjVIJB3QedsnVgQB9+92w4/Ja
         xlYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787663011; x=1788267811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
        b=igfNUx6TRkijZXNCsa2gzlyOZhmY7aFlP1NihPuqE23iSFuW7UJjUCzSXn7JkCpkn/
         QjNtyQk7Jt6mOfU/MkJ9nxzx/xGaLikqc2ua1LAr1IMd8kIHLVmp26thr4NIdGi0VHEg
         A5TwijWL5y+5pJJPrDPlSbRJw87vdWLE4Mfis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663011; x=1788267811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
        b=pZTQwHlLJAmE4elIWUHGmobRuB0KmF7s6n81P0BdwFmLS6ueGezHUxnZ/r8VStZzVq
         TKvZNYfG0M2TuNBkHCbwgk+Nz+CvcuivdeDm6recBvv3eod1kccmXrZQeq1emh8OxyIz
         nfql9XzbGS0KfOn7HAsF2CKkuy+QgqSBbbYSu/jIP18XDDMywIUzAl2v3Us1QZ+aWdsV
         2h7rKjAXXHsyhTTi/LMHch2ipY0LnU466BWLQ8hLItZM9TkBQ+x8tbOXZLLaP6LSgjlO
         8Cz/Bvp4xF8FDkQiSOTXcsGbYQM1acwdgFjv3AsXeEdJeSDQ0gb1euhU5mm2IuCu7uZ5
         E0lw==
X-Forwarded-Encrypted: i=1; AHgh+RqyfoAFR7bWPOcTzVSNMzBj0Alc28to9pRfNtKgRNTazdtpEOryPszsI7AsPlPFI8p1Zn9lmAWdW1/Curc9pOA=@vger.kernel.org
X-Gm-Message-State: AFuF++lp5EK+y4kAk/W1jvqhYQ0nzKj/I82dpvYDQYjIUu5rHK7et/WH
	nfu13jCWtZ51p4duv1j2iAqlZa8DaRj2fcdtwzlu1qB5h3IRyRWgdNeA7U9G2yeFFu5EN5wwCF5
	TnlwkH7qfA7qtJyJUCq4fzUVi0+Tv8bNVEAXnQX24PA==
X-Gm-Gg: AR+sD10tST4HdASzmiWGBam0U7ArAPMIv3wNb+UIzguXy0hJBPLPvyWJlhHVJYmA8ah
	24i0IfNY3bXIIB/Ta1/XZQk7qdw6eYUyaSTLG1Q8M5jCboJdEyOUA5DYmt7VAVOzGb0muz9pGvJ
	WXQmJ3UeKP+ARK/EyU+DRmEZl/KjYW4q5c2/b4hv1Hp00uiJwo1TgQ47+4F/cMBJV1gpYIREvx0
	lHrOrStobAURgDjqFC2xbTSRDGm7Ew25j9P8fr/og68w/aO2pWr0mwQi3Gx6DllfTnfj2VYg/o5
	fLj9g1hQxU7DsgrH5iS3wtue6KTvi+NdzAOEIlcxe16WCfibtKfmh4DQQiF0lDuLDBTdHHImP1l
	Uu9I=
X-Received: by 2002:a05:622a:118d:b0:51b:fb5f:b263 with SMTP id
 d75a77b69052e-52e2ec1e5demr67516461cf.4.1787663011283; Tue, 25 Aug 2026
 06:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820130158.254808-1-jamz@amazon.com>
In-Reply-To: <20260820130158.254808-1-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 25 Aug 2026 15:03:19 +0200
X-Gm-Features: AcwNN1V-E0YVDUa4WhV6OmS9gRNJfrQeO1sZEy5JreCrY0gVdVTUszFjJtAbGlQ
Message-ID: <CAJfpegsR1oNh_PnmK-a+k=6ttdpXYAyg6SsQe=ZMCZN03gvPhA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fuse: allow FUSE_SYNCFS for privileged userspace servers
To: Jimmy Zuber <jamz@amazon.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 15:02, Jimmy Zuber <jamz@amazon.com> wrote:

> This series lets a plain /dev/fuse server opt in via a new FUSE_HAS_SYNCFS
> INIT flag, honored only when the server opened /dev/fuse with CAP_SYS_ADMIN
> privilege in the initial user namespace -- checked with file_ns_capable() at
> mount time.

Applied, thanks.

Miklos
