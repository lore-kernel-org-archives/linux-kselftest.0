Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB84396596
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783665; cv=none; b=J3VtuGLEZFOvAr0TC/6p9Twtqq1DBDWXW7OZ+wQ2zFYhnE0u/Kso/ztzjrwkx/N/8If/BZXk8GD/XlDg9YOeyThFeIsN/BcL8Snh1ldUYfrXOUIPulD6xDPv21gvqk4RDYNnNZW6+FZmlEvrPtuNvpPQOa6BRyJmSudoSj/Y760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783665; c=relaxed/simple;
	bh=09hOL83tVBr/LihHmyAvXs8Awpdqkkb+fou4oZHmcko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=We09NZ+9CHhjwhmQiXFrtKqL3RrWXahbdN8IK7lQ74bX4N6DIvQGrTVCgon5ucefv4878DjfD4kDvkU/etshOih5OaKBA20W+Ii9ILfUK9mlL2WDNibuIT+BSHdReByTKYsB9ToW65C++FULz008z2Rdiqhc2Lnh4fsgQS6nduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6A5qf3Z; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6A5qf3Z"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ca9ec3ee7so7570912d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 14:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773783663; x=1774388463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdMk8K9gKZoM6sms8pJWkdJXlxOeTpf/a44ocaiQWz4=;
        b=Y6A5qf3ZET9WUMmFsT3KrH7uWoy7W+V0xkCZ0YI3VZWDtimiHkkvj4jM2m2R/558DT
         mEwIhce5MIZrYsXwlXungJGLA7l9XHVoPIU9Zt4zruR52v1ekl4+4PeuX09bSHzHjFpm
         6ncwtCA1MiTsti+5cmrRZglQhogIxSzRwxQS9VGWNL4Q78UU0ZYoRVMmWlwojvxalMnf
         iD4UuJzfZlxzQ01xbUxgAaWLWW8I1fai8PX9aRy9M2VJ5qb4i7zZLjIAJN6eHfoE7XGv
         3OCyFD2RY0WBiF4v3niA9K2DJ5qLRdhkdpaqZfuEmrGSitmf1ReYK57SAS7nYwlSBvT2
         lKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783663; x=1774388463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdMk8K9gKZoM6sms8pJWkdJXlxOeTpf/a44ocaiQWz4=;
        b=Hrmr58qUftBTG8Cx0P6OdnqvWjNO9Uzx5o2jrE9IVxNiPQJSEKJy1r2r0PzIsOpb1g
         qkqBOrb0trH3BeJBlryPN3Z9iZ9h6oHN30I4YX1YG53ZWZjQCIGt45ZiryxRWcDWeJ3p
         030zravW9DCZWOGFbfWh7GDTr0U75Nwyye2StSvEnbTQ/heg7JtOisuwFp1xKDRuSBNR
         tS3RjH7GHZNVcTecB63dRyvBb2I4i7pWl0yswzD/baBHIbln0mASzrsFkwkpzXviVKdH
         K3Z/RmRzzf7n8UgEnm8jxI1XwVZ3WxblZcS0VSryIb/PT7qsBo6U09Ig1xmHPDKeXJeb
         AZJA==
X-Forwarded-Encrypted: i=1; AJvYcCVXCIisBKjdRP14eW2XH06/JnLyKqoaHQbiXwf4CgBUBPts6etCC0ZR9X4obqvOI1kWVx69VYgFfLo8cXmlGKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19qmd7Zd/Cux66f8bHN4H2fVQT/NGKsFJbTfcCESbAtiR7eE/
	f156WuLq2uNY/WRYKsjJFQmX+IU6IlIKB0ScQEzuKx0VnmkYrBa+Fot7
X-Gm-Gg: ATEYQzxoi+QOxIHjFUFN56l6Tty144JL+QEpXjO9odC5HbAW1GQEPstXkMoHqUkS+2l
	iSnD8FBqmtJ/+AA0rVL7XyCPQMVBZNtA3JJClo5ZnhJTSL/60xrKNTotDO12Spw5vdarKeVggU3
	80h9dUqYyoo7bs/B1JqWIzCYQ4cwHPxO5rTwAunhpG7Saic60uRSSh0yi4CzgE3jC0IA8xhJN3/
	z0d/SNP0i2Fxw/fs565Rtw5IOrbMseag80IRBn0hRZokJR09LWCT/ting1b6gggZu+Mnv/T7qfP
	7zTRfY3Y76EbQLebS52TD5pr0WqhS2JlMVnQcuAz7f1vGQDZ8j0DquprxaHfEeFYcyiFIBB/vs7
	Q+oLzLvn+1bMciFPUAYDpaeIPmaqTCRWrSE2xv6Zmabzg21iFFXGZZ4v2qGM53g+ddEsXe6fam9
	A+r6khqcJpzQV+0aTuIVy76CbvNuVw93twQab+fBGWrYHulmxyXNiPKP/J1Q==
X-Received: by 2002:a05:690e:1a1f:b0:64c:2581:eed9 with SMTP id 956f58d0204a3-64e916057d2mr1018690d50.70.1773783663011;
        Tue, 17 Mar 2026 14:41:03 -0700 (PDT)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:58::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91c2b32fsm509608d50.18.2026.03.17.14.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:41:02 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:41:01 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 1/2] selftests/vsock: fix vmtest.sh for
 read-only nested VM runners
Message-ID: <abnKbaZ0Y9cfEXcD@devvm11784.nha0.facebook.com>
References: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
 <20260313-vsock-vmtest-nested-fixes-v1-1-d0e6274c3193@meta.com>
 <302d1a45-dd5d-4d50-a99c-ce73de196d0c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302d1a45-dd5d-4d50-a99c-ce73de196d0c@redhat.com>

On Tue, Mar 17, 2026 at 03:46:35PM +0100, Paolo Abeni wrote:
> On 3/14/26 1:00 AM, Bobby Eshleman wrote:
> >  tools/testing/selftests/vsock/vmtest.sh | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> > index 86e338886b33..c2cfcdf05d99 100755
> > --- a/tools/testing/selftests/vsock/vmtest.sh
> > +++ b/tools/testing/selftests/vsock/vmtest.sh
> > @@ -42,6 +42,8 @@ readonly KERNEL_CMDLINE="\
> >  	virtme.ssh virtme_ssh_channel=tcp virtme_ssh_user=$USER \
> >  "
> >  readonly LOG=$(mktemp /tmp/vsock_vmtest_XXXX.log)
> > +readonly TEST_HOME=$(mktemp -d /tmp/vmtest_home_XXXX)
> 
> shellcheck complains:
> 
> In vmtest.sh line 45:
> readonly TEST_HOME=$(mktemp -d /tmp/vmtest_home_XXXX)
>          ^-------^ SC2155 (warning): Declare and assign separately to
> avoid masking return values.
> 
> > @@ -451,11 +464,14 @@ vm_start() {
> >  		--run \
> >  		${kernel_opt} \
> >  		${verbose_opt} \
> > +		--rwdir=/root=${TEST_HOME} \
> 
> And here, too:
> 
> In vmtest.sh line 467:
> 		--rwdir=/root=${TEST_HOME} \
>                               ^----------^ SC2086 (info): Double quote
> to prevent globbing and word splitting.
> 
> Did you mean:
> 		--rwdir=/root="${TEST_HOME}" \
> 
> The first occurrence could possibly be explicitly silenced explicitly,
> but it's probably better to really address the latter.
> 
> /P
> 
> 

That makes sense, fixing both and resending now.

Thanks,
Bobby
