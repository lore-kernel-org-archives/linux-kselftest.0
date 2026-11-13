Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574999;
	b=lwfItLkcbvCQeQSzzyQ9ix+8tuVANTO/9LrnWiOodz04qv38cucym4pc/yVR7IMdDyC+
	 nM8SlgePrQKsqbVayLRTsT9/+zyoB5lmfr7gUDoI5Q4MzQwYnzSVi+pA187GnOKKPs1uN
	 cPlSmHvnSkoGCN66qZ74b01f7ICZvd1uqWL6ADZatgGx94eSA7O3r2ybEBIX2fChjHKMs
	 +mSKfS31mLk1p9AJAIdJ7DROukWQ3Z4CORb6IkfCT2Z4r+7xQ5BLnjiYhDb4NNp5pLCWh
	 Gurz05BzOTPGeJklfTCFuRDTkrMD6Io0bje8zmfqQ+QXXTNe6BdyNYxdRwafV3e+I/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574999;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B+8Vs+Yp/t4sjNvb+bzKDikl2pLwbkyUE3+1C85nf6Q=;
	b=1PDyuiE6DmQdlBa+AY36KGOoIEuNnZj1D1iLbxeerbTWbQS/TH0hmLtnwmw6V60m3vWw
	 lPlxhIqcT2OLluPOA3FOB0ov7CcwtWTATVVhCytvG/Zjt0YGeVuiCgOpyW0itFmbkRc78
	 WOsRyLcInc9hazPt/VtKIMCV1ELU/7+Efbp5SxAttW3ySBL4ZrNGNxneFudC2KKSj9wuC
	 /jy30/Ww9Y/sJBOhf823n1RSr7hy4tPyNa3ImsSj8gNtiC2WTFjIaNsQuBPY451kkJjuJ
	 PVdfumCp19P0T6VkdsoIprixDB0+dD2nxbbId31WyQoe7xUNf+SXMey35zp75rM8qTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zu/dJD9I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD0606A32D;
	Fri, 13 Nov 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zu/dJD9I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443361F000C4;
	Fri, 13 Nov 2026 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794574999;
	bh=B+8Vs+Yp/t4sjNvb+bzKDikl2pLwbkyUE3+1C85nf6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zu/dJD9IxV2WuikZeXb8bfuCS4pFsvaCSWQhcqGCqyhr6faG7ezYtwzldCTrszp8y
	 OTPw5+vqWCMsanCAaNDu+XZ/OpEWNwtwQoGIappHXcN7Xz+uJD5pguphPmf9v+yFQU
	 3MtMreJ3DVOb1nz9k9PK9BarE0LZuMDvcevz+bgRdFWr4gQPC8Xx16dtyro89poApS
	 +aFXTjALkPX+yN6S3dS8g4HaorLdR97Gc0o0g/HMQ+8EeF9HETVOPLvWSqbzjaZZXK
	 JvC5zC3O3VYsv9PkUqlcEBlOKlMNrrXjPmft8TppMm7vg7Akm6eLeP6v1OpzM9fU35
	 zcl2BXrcHhXSA==
Date: Fri, 13 Nov 2026 13:03:13 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hongfu Li <lihongfu@kylinos.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	hongfu.li@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: mlock2-tests: fix fclose(NULL) in
 is_vmflag_set()
Message-ID: <avcKibrnNmJn47fL@gremlin>
References: <20261113-for-mlock2-v2-1-f62195fc8394@kylinos.cn>
 <fb5ebeaf-2e3a-4d5a-9fb1-e86c1f10252f@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb5ebeaf-2e3a-4d5a-9fb1-e86c1f10252f@kernel.org>

On Fri, Nov 13, 2026 at 11:31:55AM +0100, David Hildenbrand (Arm) wrote:
> On 11/13/26 03:52, Hongfu Li wrote:
> > is_vmflag_set() jumps to the shared 'out' label when
> > seek_to_smaps_entry() fails. smaps is NULL on that path, and the
> > code at the 'out' label calls fclose(smaps) unconditionally.
> > fclose(NULL) is undefined behaviour, so the test crashes before
> > it can report a test result.
>
> I was briefly confuses staring at get_value_for_name() diff below. WHich is
> clarified below.
>
> >
> > Return early on that error path instead, so smaps is always valid
> > at the 'out' label.
> >
> > get_value_for_name() follows the same pattern. Return early on the
> > seek_to_smaps_entry() error path there as well, and drop the now
> > redundant 'if (smaps)' guard on the fclose().
> >
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
>
> Fixes: tag? :)
>
> Apart form that LGTM
>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Similarly,

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
