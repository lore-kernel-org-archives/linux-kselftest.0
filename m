Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F82B3A0EA5
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945859; cv=none; b=Y8Cfl1pGZ00fAAVkXRxE03ZD9wzCiwcyd1ZSQD20XVgvV6duPOl/JhqzZR4uRqiigWxSmQdY9O9Onatq+zgh5YqJ2QAc98kwHnnAaMiYVR7F9ckDptw8PJCcaAfpMavli/fuK0MU2CvNaRtK6F803P9ld7luPog+MGUkokTiSw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945859; c=relaxed/simple;
	bh=Yw++ySpwmZARZwDkHxFtsIMZXrLfykb7FK8NOCCtc9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOjaLBeMZ4ccP4fWhYHctc/gmFG2tG51dWuwhLXB9SbEOaJWr1zjqYfKGJMeuJKYEtmM2TVsHg8ei3cqe5x6TBO+ksCypA9IrTlhfZOFoAq2vk/e5ZHolJ6U8Yk7yL4gWoTIE2/sYttYJwc8VvnPxBokySsk1dDDxojoFeF1H1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AjLrD5cK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=btAvDqr7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AjLrD5cK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="btAvDqr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771945857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWBmRFKI0tFktXtE/HuJ4+L1Im2+ihdnnfM72IEIXjQ=;
	b=AjLrD5cK6Cu9GyGjueSPh3z5gnylFPABS6/aQi9cguk462QlG2GdNrZGxdAjiI9ohF8iSc
	NQ2N7Y3DqYCOtPAokc54A+OAPgkuNiUE1lX0geA+nj2ixixsy6LSpdpbFoNoUE6da11omk
	1TDhhyMJLnL54hG3XQ8saLX+oMebsiY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-WCha4tnUNriLKfjfe7CQBg-1; Tue, 24 Feb 2026 10:10:54 -0500
X-MC-Unique: WCha4tnUNriLKfjfe7CQBg-1
X-Mimecast-MFC-AGG-ID: WCha4tnUNriLKfjfe7CQBg_1771945853
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-483101623e9so49170945e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 07:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771945853; x=1772550653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWBmRFKI0tFktXtE/HuJ4+L1Im2+ihdnnfM72IEIXjQ=;
        b=btAvDqr7vvNnFS4194jqRw4VC3ROpgBO6TygWYlhe6ZG9pJOhGvuaAIxz6x/RIaFM4
         vfNUYADX7F4j+MDVdCRlXREZacwsIs5eeHNvPyRJtaoo/3h9U8pEFBU7rhjHsH2p/bDG
         1swDCn9xmuN5nk4W19vrnQLSnQK9mJweJXsQwmj2kgltLdR2zoBvRI/qGy25NabkkUcP
         GsCJWJz/GMgqtphXCbaFuJhoq1vKao9HOwXcuqCIoPTERYrlXArwZPgRAnlJfp9arWg6
         wWhMkLwalVmuhL3Q8MBjP2VpNLkx1mSR6LSqlkddtGLGKOzTqMvTlarl7YcgRUox6o8K
         h3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771945853; x=1772550653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWBmRFKI0tFktXtE/HuJ4+L1Im2+ihdnnfM72IEIXjQ=;
        b=vnmkQASEYLPU7G6ZQRSEOGhBN92ErBrAepe//geCt/V5wkCAW8EUjPJ0vNHguKJG2K
         8Q9Z9IsaJ/Fmlgfu3mhzoTywcS0s+dhPD40dJQTrTH0DxR6xs7R+JTxmOcdrNe0pU5+0
         hOIlg/EW12sE2i99H1Wbl0J9J1FPOjlCFJ3BDdmjhmdSz8O1IhQiqXZpkz+souSjto7K
         F7Q3mGy3Gebq2/x2TYLVACdMRDyimEG1CE6HtPlfn9PlHd3SRKCoWc5ychhEI9fJrxBa
         KJxFhGy/H7TJCeMG2GDHvLS5g7kNzftnC0z9nqDWQ9VKVtxPIouJLpadleel7ygvhH8c
         +HdA==
X-Forwarded-Encrypted: i=1; AJvYcCXR0vrlPPf7vdfgQYj0j36aLOKz2ysGrhwRcoeknTuctfyot5eMuF+SfNDdauDbyPbikiyxU9LQPWey6jxdCsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvrM/pOcBzQ+TNbX4K7ER0jGWB4NxC6jJdW3zq4YwnhbjwIay
	vlApOg2OigSmDK0ohWoPU+x9CA1wRU2GoFxKAXff865Wz/vwVCpvpBJfEhlm+ca2VDNgGX6jaW7
	5PBlsRgQWpIzkys0V7ynwQHOjNyQjXiYRYnlMs2tLmx1GDwEK1HGUJsnwQv+co/I9/6TVrw==
X-Gm-Gg: AZuq6aKt8yyZ+yYpzD7DNLQz9C16FIy/H6aMfDlbNF+kTzdCb2Z5OssROLPFrTHaeT9
	dfUyVPp5xG8DtEyUe7MZe16dpzCv2wQqRveKSC+RAWvuk4V08MOye2ApY9L1mf/iKkrMlrYjaQR
	hnKFDkvkHZf+3YvyNmwqyuZgLMdWFeVIXJnap0r6AbEj3f0sxw9fkUGoxItq8PAwWA8XZnBWpow
	rn7LKcTaU749JlF5f9gJ5oJ9S0OXiwVSvBhkTiIOHZlu7+1pmtKt/mPJsvwm60Z7V0Sw1wrOJTZ
	lyWoZWe3FdKhdboed7tcDUlT+6yRXscw8W3wLzZRGOs6Zhm5pNvc6Fsk2imKcrycQYPqy5kW22l
	0p8z+Dm1F9ypbVH0C2BuGEJOnauIHD6fW+5IMfgs538OaWZUqgD1RaKawzE/ayWmR/dQqrog=
X-Received: by 2002:a05:600c:1e1d:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483a9637a55mr225647055e9.25.1771945853016;
        Tue, 24 Feb 2026 07:10:53 -0800 (PST)
X-Received: by 2002:a05:600c:1e1d:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483a9637a55mr225646485e9.25.1771945852482;
        Tue, 24 Feb 2026 07:10:52 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm9484475e9.0.2026.02.24.07.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:10:51 -0800 (PST)
Date: Tue, 24 Feb 2026 16:10:49 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	kuniyu@google.com, ncardwell@google.com
Subject: Re: [PATCH net v3 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Message-ID: <aZ2_cPL2zCYQznBI@sgarzare-redhat>
References: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
 <20260223-vsock-ns-write-once-v3-3-c0cde6959923@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260223-vsock-ns-write-once-v3-3-c0cde6959923@meta.com>

On Mon, Feb 23, 2026 at 02:38:34PM -0800, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Update the vsock child_ns_mode documentation to include the new
>write-once semantics of setting child_ns_mode. The semantics are
>implemented in a preceding patch in this series.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
>Changes in v3:
>- update language to clarify language that first value is locked, but subsequent
>  writes succeed.
>---
> Documentation/admin-guide/sysctl/net.rst | 3 +++
> 1 file changed, 3 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
>index c10530624f1e..3b2ad61995d4 100644
>--- a/Documentation/admin-guide/sysctl/net.rst
>+++ b/Documentation/admin-guide/sysctl/net.rst
>@@ -594,6 +594,9 @@ Values:
> 	  their sockets will only be able to connect within their own
> 	  namespace.
>
>+The first write to ``child_ns_mode`` locks its value. Subsequent writes of the
>+same value succeed, but writing a different value returns ``-EBUSY``.
>+
> Changing ``child_ns_mode`` only affects namespaces created after the change;
> it does not modify the current namespace or any existing children.
>
>
>-- 
>2.47.3
>

