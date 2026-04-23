Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA430F95C
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955815; cv=none; b=kOWSdN8zzGbhggRukfHov9jvKbmLzOkuUR4zA9NwsbaF/RqwjvfS4nW5/USAIHEw9gzSO1rztHW4/dcRdYkqJmHk55b1ArgS4/blOg/jaMJop0khW+dPN0s4qeiFye6zgA5A5dB2SFdsaj1GOdIhEetDNyf9MEyGxwmdVCDsjE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955815; c=relaxed/simple;
	bh=Mc9Ivz4Vqi3k0d4nNCkfaFzAMJGthygwguiunClkBVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLIWgez7Dn5MnBfQ7Uy+KUHy/+qskkx7pJPerfbIzkLrO740If4TFJWdEPkkQfXOSQjrDlcpDMZAPnd+h4o3IhH0yASy/sQo1MRNOb4vNHGbe5IYBpjMHxf0RXEc2+dN6V/ipunpPNlV4JJE5gmXjMzvvqBb7GOofjnWI40OOQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YKtuat50; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=caFb9AfV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YKtuat50";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="caFb9AfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776955813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9FCzHmWnVVCccSekWVzHWb5njrn6p7+7lqlQWHM0xY=;
	b=YKtuat508qOZhOekyqkUrqYzPyBW3fsoHMjnvaNwPQr7kgQcwk/cKlsq/6zthWyGoiergT
	gEJmzYgtI20bpFWHe5y1sTgm7yjSLp3P9p8eFhQ3cpCAiTdQd7v2JB5NEUcceq4xbqOPe7
	pXapCYZgZuapgI+8w3ZpyyjvsuRp2Sc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-Mh_B5gSDOxOQVHbtUxbxwA-1; Thu, 23 Apr 2026 10:50:10 -0400
X-MC-Unique: Mh_B5gSDOxOQVHbtUxbxwA-1
X-Mimecast-MFC-AGG-ID: Mh_B5gSDOxOQVHbtUxbxwA_1776955810
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acafc224a8so169863496d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776955810; x=1777560610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9FCzHmWnVVCccSekWVzHWb5njrn6p7+7lqlQWHM0xY=;
        b=caFb9AfVP2PMzQ44LcvEB+VhqljJBvIJsPqIfqLqlhgzT22qYQT2Kyh1N+lyfefTSS
         glXyUKbmwVzY3WHh1VEHj4r652BaCmCveqJMaT65wCj5sztdk8YUlCBcneqsPvudUn5+
         20WyJyHkhy+RhrHrjM02rrikt98A1Jbl+4Zv9bAeKBLl9FCpJUZ/QiKa0L2gY/kVH8b4
         pGdnx3oxfzvtcv7CA9pfKFecJV5YAQTXStRNeLmVY262C75kbqg/RJGoeV7/NxvRtqKT
         cbaP1KEQxd/x5F7NkzwvUOwOPUZ4Ar2MTE45+F4r3/3GCT9c6zCCDMk2WQhwuzAngkZ/
         xL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776955810; x=1777560610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9FCzHmWnVVCccSekWVzHWb5njrn6p7+7lqlQWHM0xY=;
        b=jM7kTzBkQTiighD17LoUBhMDWJoT4USBvsdhVLW45pHnXgBon8CYmrwtzRQznxKMou
         sLqJrYALRMzfPIrkzPQ78iLMWW0HfJLrh52voEeO9pjlfChr+iQcNypp3MhMGbu4k9ep
         S33uLORY8hN4NN24AjNH36uRakzFU72sfnKoAGT/jBsD9jwQAfyfz/c8ZdcNygaYFVRP
         HqR8q/czzsb4uQLkvnFMZkPjQ4RmmEogpNLTrtgFIqTRbeQfxI94W8B3mjC/JqRAVyd3
         jA29F1PiwmXPBFBgK8is+vUVcb8bx19tYurVwlyjkigaGOHTZNeIyStqpRhOMUYdrqdd
         ieTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GWRZfbA8XSCmHCgo7PvUzvKuhgiJk5RlfsxsT3nJJm3m51KF1rwtazZy8YLSaCXcGYs4yiugb0QaSVKw4Uyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDYanYcXZ1DYxcQtBCxYQkYTG7iAghTYMAzdHa0yZcuiGDe6b
	QkIKF4daiPT7xVpiyE1/gDEjUB+W0aDr2Tbo87iKGReK6/lr3YEoOUTMLaeaNuezlSRJn4uIE04
	4l2d0ktHRHxLa37mBpvnWWLk/xg1JBgmSUyPoK+x8g6/4byILkBKxM+oVSqFznqLhPvrKSPqTrw
	M78Q==
X-Gm-Gg: AeBDieuGZFw2HnMuWB/UWNItW3GeCs3+zc72QUqsblGLZrVXjyKsIIwxoS8vjHOFvVW
	bRDZnFxnHxSgP3b554Z8YRg5Ct9OCUpHTxeX1CFGepDpq3mjkaNML20VUVI9yVqDAkEL44u/FfN
	NgHQqVdDnS4832pLJTVNqaduxiFCNUzqWVbiIzze3/qy3FrwgMTzqiVuDivMp6I9UR+/0E8AwTh
	msHezVUGUOI+h8jn1BWUnNjCtx+vINcLsN6jNOrrwNmlUsKWmFRzT5pi5jeahVVZ73WshwJLVO0
	GxpWbLr/YuSkReWAlTJX40n8LmpJNsKvPZKHwn4a8PmTBqn/xwU4axOT9IRziOvWa31XiTZ1x7F
	73WRmg24CsiwktYMdA0kcOR4Y8fa7/LC46grJxB2lkCS5WmNWXsLKePlIEg==
X-Received: by 2002:a05:620a:4084:b0:8dc:eca0:35bd with SMTP id af79cd13be357-8e78fa1dd25mr4108115785a.5.1776955809701;
        Thu, 23 Apr 2026 07:50:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4084:b0:8dc:eca0:35bd with SMTP id af79cd13be357-8e78fa1dd25mr4108105885a.5.1776955809008;
        Thu, 23 Apr 2026 07:50:09 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d98c15a9sm1850297485a.43.2026.04.23.07.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:50:08 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:50:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <aeoxnuGKO3uqS2kG@x1.local>
References: <aeDoqFWPFxkkNB26@thinkstation>
 <1a499781-1115-44bc-adbf-2ac3769354ca@kernel.org>
 <aeFCuLJXT8VOkzH7@thinkstation>
 <4c635703-3d8d-4cfa-bb98-7f6f5fcbe547@kernel.org>
 <aeImfRrrvr3UoKtL@thinkstation>
 <aeTnlQUOOh-dHG8z@thinkstation>
 <34f75083-29a3-4860-8a6e-94551d37ac6a@kernel.org>
 <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeorZMvKwu8zKX5i@thinkstation>

Hello, Kiryl,

On Thu, Apr 23, 2026 at 03:27:11PM +0100, Kiryl Shutsemau wrote:
> The patchet is pretty good shape in my eyes and will probably drop RFC
> tag.

I still have some high level questions not yet got answered.  Do you want
to answer them?

https://lore.kernel.org/all/ad59TxAHNwFWH7Cc@x1.local/

In summary, it's about:

- Whether we have explored other approaches on page hotness tracking

- Whether read protection is required for an userspace swap system
  (e.g. did you get time to have a look at umap?)

Thanks,

-- 
Peter Xu

