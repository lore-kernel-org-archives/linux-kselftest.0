Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66BE2D94BB
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771450493; cv=none; b=a0eu/LNJsNO6UFoE58Z4zkkVjr4GQ3HrIncJI6G908g9f/wh7Q3dwDNKSVuB98N8+0VpWDPj1nxoxHNSqieVuhpqRPSJvyc9qrhxfs8fZ537psZXHj+aixCT6L/gUIY+qbFlw1PzsWgn4nrGGOIej+d+x50Pu6rOBmOC0AFyZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771450493; c=relaxed/simple;
	bh=d4J2Wwfy4bpwp/Wyy0MXG87xaedJ9FKZnZIYp3QGksk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVd79Syflwf87+Mf0FEPD5Evf9K/VmbLyfTf54ePGfmtqG1ljRXfgcLKggUvQIlaZGx0XOuuTyNWWde3PwFxz7Uz07txVCfz4SU6Zr9IguZXbvHJa3UFQw2QaX5jWGxQTcQiPGDDZ0cQvf6BG2FN4EHp445tI/8jRGqgMan5A08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpYuew+r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ilA/lGkY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpYuew+r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ilA/lGkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771450490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UD658ZwKuP2PF9xMpkydfrRh56szUrbMAmGplK3iBZk=;
	b=YpYuew+rDzq46uW2raPbwug7HFVCU+No6lmG24dlNGbfyGbsJthB/A6Dbt1EsBbKQnlfNw
	y2B2ThsoP51pGBPqV5AXbxgn/NVeAMgJ13tpSWD9i3GcYtyStSt0ohyk8/+5Eu8kCt0B3T
	14jCUcfQAcOzbBviWBgyKOQJq92VCQo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-wIGxZGB3OCSutIsZJ6drFQ-1; Wed, 18 Feb 2026 16:34:49 -0500
X-MC-Unique: wIGxZGB3OCSutIsZJ6drFQ-1
X-Mimecast-MFC-AGG-ID: wIGxZGB3OCSutIsZJ6drFQ_1771450489
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so252185185a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 13:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771450488; x=1772055288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UD658ZwKuP2PF9xMpkydfrRh56szUrbMAmGplK3iBZk=;
        b=ilA/lGkY7PCnCWgGZ+gX+zAm3oKKHDnNYPX0Cx67V+VlZzcN3eVAmVJi/3GVjDBEUJ
         kumsoaS+SR3XkJGaJC4rqRKOBzrIu+0wYjtqoS21ceMa2yGkNw1JduCciEE2ofq3V6AF
         7PfNZ0DNC3MRVrNASZ3GNxMKfbpjlzLbCYHZMFrfV+V/8LBXsjlmn9HIug4NT8fF5Ir2
         RNbzwtmwcAVerpnAVMrJx1If60N46u6brVP7ZJocYiv8NqgCGmhfYC3XBCpWvL6HjQRt
         hnPtxhqTF37kW/En/HEL/iGtqCD3KzzZBCU3C+5n9pEk99E0MtONGPfLDJtdTEynUQjh
         fmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771450488; x=1772055288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UD658ZwKuP2PF9xMpkydfrRh56szUrbMAmGplK3iBZk=;
        b=NsyAMvMO/oOV4r/pjR5+id+HyAymA5WSJjdjKFY9xUkZ5KMs0krEXGlzZYXgiDGWEN
         8Yq3JjGhfCMAi/9G/N5CCuUUtQWyOlYUV8uahPEdrrXtd9nGvtsWQom9a60vmIPK4ofp
         RY4nAzJ2GmQvZtR76Kb74GhwBgA3XY7lCovGDCE4OIVzLANar3VrMOUZ16zoDYt8ovMQ
         0oasH8WNbSZcdJjuffQAHpB9swwj0wgrxHwtHjEsd/2AC1uXQrX9E8ZtCCi5ptLTK6g2
         7slvCAG4jRwgP+hZNOTo1va4fvOuJfA39vv/GqPwR/v7SiEmKtpT8qQDxZSEFJCuw7O/
         EGsA==
X-Forwarded-Encrypted: i=1; AJvYcCVGGlwrHbKJi4ccO4WdwQx0ZiAKWuKXcKjDaD/bJHAJvpU1eOxmXu7DYzROVxV/fViU411wrWJaHXSgDjQnMCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmhb82pewEGWvmh60I1aCu5axOmQUvkeVn3CXQc0BC/JP4gfx
	ObxGHgHv+qGvsl7a7ab2vsAepay+OD9LMZpY3trbd29hDAcIFltbMNNj48NsDtIWb42FWAseqjV
	z0Wl0ZMf1Tnay+ooMN8jKzHQyIIjVvJe2wYr36zFOiE6QDvDlNiRDuRo6/KDleSnIDpFpeg==
X-Gm-Gg: AZuq6aJwYez09KMOW0OKEAXQ+HMmYOPzJQQirZkLVIBYxO5h814+jah7gm/HVrM+yVW
	Iq4axG/WY9pbhnG42mFHSJ471PG0jTq9u3suert7LLs5+vXm9fxPySGmxB9e7vo8H9E8b9APuVw
	AQKNyBm98van3r+AQvg+3XokA/FcYRs1SyqJraI6Ucde2iTwrnPuPHkqahLqy99qWy3kGvRW8qq
	+Sfxmy1M+MkpVCVYVxk6btGNTBn+A3Oa1kQrxd8eY+5PRUvChap0bRDHgPO2IRPuw5022IV+oaB
	E4JodbBKcNVEp3Okn9rPF/0x96WybFupjEZpYCNuybMbTfUGcNNjmyxAjNGriHJXvfofLWqBB6n
	OHR8+jEvdc1xmoA==
X-Received: by 2002:a05:6214:ccb:b0:896:f588:b2e0 with SMTP id 6a1803df08f44-899580c41a0mr45451396d6.48.1771450488607;
        Wed, 18 Feb 2026 13:34:48 -0800 (PST)
X-Received: by 2002:a05:6214:ccb:b0:896:f588:b2e0 with SMTP id 6a1803df08f44-899580c41a0mr45451066d6.48.1771450488156;
        Wed, 18 Feb 2026 13:34:48 -0800 (PST)
Received: from x1.local ([174.91.117.149])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b218258sm1888631685a.47.2026.02.18.13.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:34:47 -0800 (PST)
Date: Wed, 18 Feb 2026 16:34:22 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	James Houghton <jthoughton@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Oscar Salvador <osalvador@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 07/17] userfaultfd: introduce vm_uffd_ops
Message-ID: <aZYwXq-x8vMSPorg@x1.local>
References: <20260127192936.1250096-1-rppt@kernel.org>
 <20260127192936.1250096-8-rppt@kernel.org>
 <aYEY6PC0Qfu0m5gu@x1.local>
 <aYhh2XzyFsJbohll@kernel.org>
 <aYzZ-zBipYQ2OA_n@x1.local>
 <aZIGp0F7uuS9qYVZ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZIGp0F7uuS9qYVZ@kernel.org>

On Sun, Feb 15, 2026 at 07:47:19PM +0200, Mike Rapoport wrote:
> I agree. Will move the check for the markers back into userfaultfd.c

Thank you!

-- 
Peter Xu

