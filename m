Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589B3537E8;
	Wed, 25 Mar 2026 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470008; cv=none; b=Dg8WSUyALmx1oVa3mugOaVz1NmMhYG043bieXrvzB1VgyEAT+6vdDYUpfCJG3L24jpIdGXaiI0r8GdjlALewBRXCyVXwMPuLES/54SsqsnV5H5OZwZz6/ZWX9Rd+5RvcFzjhdJkIS72zO/4HmHLhEu/HQjR/zehB/CSmiX2qW3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470008; c=relaxed/simple;
	bh=m2Fl41u9xLJTkmSNH5fjQam5qUXk4fYiC6RqiBkltaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BmTNTHA+41FRnl0RtRJ6CrpJjexwLMxPEEGDBb/EKmylqe3FSNWreUc1fhytDECZzsnTlV1+cXVi5WyckIaT6COVbhOUr32/ZQD5M0w3Kkv8sE7r2hzysFWb6iN/Rz8MpOFnpfkWNAQtdSTzyp5sYal5cg6EzNmFAz9gGSzjDvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GU+v1K7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GU+v1K7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FD9C4CEF7;
	Wed, 25 Mar 2026 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774470007;
	bh=m2Fl41u9xLJTkmSNH5fjQam5qUXk4fYiC6RqiBkltaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GU+v1K7XSxXX4E0yHH4tMzTYTOXjlrFI9KahS6lpnxCCUeiTcf8ArJuVLOxCdyXvU
	 C0cEb4VlNmH8ejylJDPRcNn1sXYQwDEwZ1J99U0jrmVzN79RUGBmalzZl9Q46R6mwR
	 IikMJprq4RaB7nTU5tFXRZIjTPC6wqEe9YIZSkjgLxxMsYY/fiKhAhT815DSCEBHs7
	 jTmPHaKWKbddIS8Py883wleUllgGi44zHsC7Q3/g2Me9bH9vGqtCM9r0oC+uLTE0DD
	 Rpa97eC+VEs4r+K8weLuQiKcb8nNglKntRrDUeFeL4s2SCO21lPuj4JG2Wgv7Jf/oP
	 ZvqhaVC6dCfqg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  dmatlack@google.com,  pratyush@kernel.org,
  skhawaja@google.com
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
In-Reply-To: <20260325182026.467307-2-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Wed, 25 Mar 2026 18:20:25 +0000")
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
	<20260325182026.467307-2-pasha.tatashin@soleen.com>
Date: Wed, 25 Mar 2026 20:20:03 +0000
Message-ID: <2vxzikajacgc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Pasha,

On Wed, Mar 25 2026, Pasha Tatashin wrote:

> Currently, LUO does not prevent the same file from being managed twice
> across different active sessions.
>
> Use a global xarray luo_preserved_files to keep track of file
> pointers being preserved by LUO. Update luo_preserve_file() to check and
> insert the file pointer into this xarray when it is preserved, and
> erase it in luo_file_unpreserve_files() when it is released.
>
> This ensures that the same file (struct file) cannot be managed by
> multiple sessions. If another session attempts to preserve an already
> managed file, it will now fail with -EBUSY.
>
> Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

For memfd and hugetlb at least, we serialize the _inode_ not the file.
The inode has the contents that we care to preserve.

So if two FDs point to the same inode, this will break. You can do this
by first creating a memfd and then by opening "/proc/self/fd/<fd>". Then
you would be able to trigger the preservation twice, causing all sorts
of problems. Same on the retrieve side.

So I think you should be storing the inode here.

Except... IOMMUFD and VFIO seem to be using different things for the
state that needs to be preserved. I don't know either of the subsystems
that well but from a quick look, I see that
iommufd_liveupdate_preserve() [0] calls iommufd_ctx_from_file() (which
stores the ictx in file->private_data) and does most of the preservation
operations on the ictx.

Similarly, vfio_pci_liveupdate_preserve() [1] calls
vfio_device_from_file(), which also uses file->private_data.

So, there seems to be no single way to get the "target object" that can
tell us whether it is already serialized or not. For memfd and hugetlb
it is the inode, for IOMMUFD it is the iommufd_ctx and for VFIO it is
the vfio_device.

So unless I am missing something, I don't think this approach will work.
As much as I hate to suggest it, I think we need to move this check to
each caller so they can find out the object they need to serialize and
check if it already is.

[0] https://github.com/samikhawaja/linux/blob/iommu/phase1-v1/drivers/iommu/iommufd/liveupdate.c#L210
[1] https://github.com/dmatlack/linux/blob/liveupdate/vfio/cdev/v3/drivers/vfio/pci/vfio_pci_liveupdate.c#L145

[...]

-- 
Regards,
Pratyush Yadav
