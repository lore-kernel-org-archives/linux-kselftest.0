Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352432F753
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771497409; cv=none; b=eL0EvieLzlGx1uEdG9JQ+0P9gVtu6+oi5V2Eu9Zh0r/6/+JZDAuCHwM4vcuRWldhLZQBQZCzMlxt/2LS3yOI4ftCDUuEstqXf4Vs0ATBp+lYTXziMYXMBfuq6eM5E/xoeHrZsIBcQyUT22lrEkvSwJUfm37AWDx90rLxJtlnu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771497409; c=relaxed/simple;
	bh=oqw0KlNKIPYnEI20309wgxqKSge7eobGKUbr1LdjuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPTBxFAtxZtqIdOBBve6RmkYGH3uGQmVjUh4SObvA1orsg1wiPNmKk/5vseOgftavHzqiRyhTd6VsmmwTkV0pugqak4ioGp6tvbX29mSz0ZXwEpcq4UQGJZkMtyE3/hZPtOGTPS5aMeFS/zeASGZt0KTb4OWO0UyTTe+OKoC244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fP8YIe7Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qIsEgonr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fP8YIe7Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qIsEgonr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771497407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0HuCXThfRUEeEl7yH4RijL3+g7m+evVIDET2wFtyGPA=;
	b=fP8YIe7Y7YCduuZ+wD3Ap+qBUjlLZjGAhQqtnkYaC7nAKRaUi+4yAF3+LK7vzwgTXxadyW
	FFntZkKvt+sC3r2nQXM2FneIMx2NQeXt073JK4f06DZfH5MYTVjuCH4t1yAAQLuv1IwtRN
	ScqhJQU7y7h7wvxc7FM5dWvUaScB6qQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-V9SzqAk4PbWhvh3YvqgjPA-1; Thu, 19 Feb 2026 05:36:45 -0500
X-MC-Unique: V9SzqAk4PbWhvh3YvqgjPA-1
X-Mimecast-MFC-AGG-ID: V9SzqAk4PbWhvh3YvqgjPA_1771497404
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48372facfedso12901125e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 02:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771497404; x=1772102204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HuCXThfRUEeEl7yH4RijL3+g7m+evVIDET2wFtyGPA=;
        b=qIsEgonrPfvZJWqC1SF7flDp7dYt/nEHIjpY99Jbl9Yo4ZoBYfcrfBxW98RFMYJStX
         OhWdWkrrmR7WZe1IoL+EnvtqZyDTl5catuoBvtFPloxY/FDnMEW4aySa9FLP3I+23f6w
         AQVPSUQZcFHfTcJurL3NXkg5ArIZZt22k7TQ/WeBEreojzEvkvBTguymSNbQOBciACG0
         IuVknXHwPhcfjTQegTSKy6f7mp3eMYtKk2puiPpfKWRr1jhAdat/JTLt+3zgvTlsH9vs
         uw9UGWpTEBDOLfX/KaVNCH9rWBOuI6o22LJpmnBKjXJoBwHlfuO0lzW/fF0yksVGrL+L
         P/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497404; x=1772102204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HuCXThfRUEeEl7yH4RijL3+g7m+evVIDET2wFtyGPA=;
        b=j6Fh9johwWam3H+Wl29Hr8TQgZC4c/ww0ESg+RcE1eFCeH30Fo9fjZSes0aQF+lciX
         45+6iWuqEZbCutPNwggeMjFGZ2oBxwwVtIEQ3tKUXV1Xria+rz/xuT3xbyP414d6Xb/0
         +rSH4y2JmzQrb/8WO+rcci7jfTQSRtsOCJkfzfSV0slvuXIB7/RRpWL127uDzeqbVTYd
         AULQn6xejdfq/dwxsbUuT+Jn4Co02HB5qLS0DTGzk6zJjcIfqUsxu9Qt1DlZWoAHGzlR
         Qdt4KpvhGQ7K/F3K2tiTk4D41lr6CkTWCRGlZkIijfER9zBbBavKk1A9nA7Qj5r09c5r
         62NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsg00fDWatiOfyK7IuYT0x/ISPH2qZWbaQ1PIsp8oNa0EEKHSSt0Ud5L0n8yMXnoBiffawtAfc3LMAfwdZI2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdIi1LNzDtFGvQvyV8/ztQDK8ZUxinxyD8V3toRndHrfJwqU8
	9Sz7lHGlVhQIRv/BNSREVnOsXScP+c8PSjB6qs9IXHIa0qWZ2/MpK6ZzTn4fy8uiJU7cnyM8OwC
	19bNgzhj67VhSo9TjGN5WfGkCdau0ziBoqsRkv6n+C33pFzn7Tk65uUGuyW1WEO2YZwDDAA==
X-Gm-Gg: AZuq6aI9akFuhaO8o7RrNOypSzqiEcgvaj1Pt1BWUnyMDVskxODkQWlwwJGpSQEcVpu
	s5vAT4TLpc77eoOGobVTuoOZD1p2yTHpiMDsxCKRKLryNVscWNz4iovKv9ZNnynI+7AQmBQzNij
	k/zrch+t0XQ7xuZa6lX/phjAXY708ma75b1JD0m0mHJvTbdaC4q9pQibVRTFG1+zm2p17pJm5O5
	X+4/9UdQ8CoiqL6MpiQqq5adiz548Hz4X16Xf0xyJwDS/naeKVbjddRZZThoQTVaC0dCX/Rlufr
	nXRucCN5AfDdDQZFIbjx8tmiAmHrk0OD4B8MQ2O/13Mkh26YCCLhFHdJcLSAdmgfXV8Azm7a+OC
	eV5fkSb5EQmRaaG/CjEINB89gyIa5V+j5FUDcBYWb2Dm24Lnhm+7BonjvGWFTlodyWjL5MAc=
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-4839fe90522mr18467605e9.3.1771497403797;
        Thu, 19 Feb 2026 02:36:43 -0800 (PST)
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-4839fe90522mr18467255e9.3.1771497403315;
        Thu, 19 Feb 2026 02:36:43 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f99067dsm17354955e9.29.2026.02.19.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:36:42 -0800 (PST)
Date: Thu, 19 Feb 2026 11:36:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Message-ID: <aZbN8fXtCkhItSV8@sgarzare-redhat>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
 <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>

On Wed, Feb 18, 2026 at 10:10:38AM -0800, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Update the vsock child_ns_mode documentation to include the new the

nit: s/the new the/the new

>write-once semantics of setting child_ns_mode. The semantics are
>implemented in a different patch in this series.

s/different/preceding ?

IMO this can be squashed with the previous patch, but not sure netdev 
policy about that. Not a strong opinion, it's fine also in this way.

>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> Documentation/admin-guide/sysctl/net.rst | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
>index c10530624f1e..976a176fb451 100644
>--- a/Documentation/admin-guide/sysctl/net.rst
>+++ b/Documentation/admin-guide/sysctl/net.rst
>@@ -581,9 +581,9 @@ The init_net mode is always ``global``.
> child_ns_mode
> -------------
>
>-Controls what mode newly created child namespaces will inherit. At namespace
>-creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
>-initial value matches the namespace's own ``ns_mode``.
>+Write-once. Controls what mode newly created child namespaces will inherit. At
>+namespace creation, ``ns_mode`` is inherited from the parent's
>+``child_ns_mode``. The initial value matches the namespace's own ``ns_mode``.
>
> Values:
>
>@@ -594,6 +594,10 @@ Values:
> 	  their sockets will only be able to connect within their own
> 	  namespace.
>
>+``child_ns_mode`` can only be written once per namespace. Writing the same
>+value that is already set succeeds. Writing a different value after the first
>+write returns ``-EBUSY``.

nit: instead of saying that it can only be written once, we could say 
that the first write locks the value, to be closer to the actual 
behavior, something like this: 

   The first write to ``child_ns_mode`` locks its value. Subsequent
   writes of the same value succeed, but writing a different value
   returns ``-EBUSY``.


Thanks,
Stefano

>+
> Changing ``child_ns_mode`` only affects namespaces created after the change;
> it does not modify the current namespace or any existing children.
>
>
>-- 
>2.47.3
>

