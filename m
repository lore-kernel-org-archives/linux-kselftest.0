Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071036B047;
	Thu, 26 Mar 2026 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515868; cv=none; b=TPcnDRjmAgdPnz27FoL9NUzZhD1QVtDJKeXBbd2FioOwwyDc+8dVqT1i7uZQh2qR6yhPLCBTuOyXGnnbmSfg3O+9xSqqA1EwwAVRk6nS9KLCv5rrp9kTfkihYBj4EfV+kSVVSONn8T8JCNSlWcwJ0w0f4EyewRXBvgmU0+GDQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515868; c=relaxed/simple;
	bh=iYLe7tMvWLZ8XmOqZgsqZUuDbTn6c4gDSEIS+FTWtfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjmdNwuTUyutzxJG56MTj2voDrnmIjR/0VO2jxgiOM4nEGA1DXBHqNmMqa/6FXITj18XYbzwzLItME7fJn+Y+eDN+HbQlnee8yl1LFGe6wN3D1DDar6nPGakodsnpSgMJ1PLReLD1FwBWqZ+izUCyx8Cbo4NIIORl+rSAD2tAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6tDDIjp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6tDDIjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC30C116C6;
	Thu, 26 Mar 2026 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774515867;
	bh=iYLe7tMvWLZ8XmOqZgsqZUuDbTn6c4gDSEIS+FTWtfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6tDDIjppwo5iydJp05VoVjwZRJCeS0u5deC7cL3xssqdQ1abiZJ1cLIZfAwJvBCB
	 E/8UsrVorkMtvAUmUDcbNaMFdwlhEwaa45Mv+qqh3VPSX2NmLKynBBXqeiOhaVdrZv
	 BNlYhzHnP+GbVcVnoFcrJfQxqpM/RrBqpBe3GFx6qhenQmEnKUvcKcNlw0F9ml3vhv
	 SBfi54HyjPFuH/HudwRZolrq0Z7VA/bXYdejOsCLtCG86As0ZknckLDGan5umB/OUm
	 XMC06bGIvyNIvku+ex3Ii8wJqpZ3B7/QtBVLk0rCY4mhFWI7wdtjf2rdmQldpjjiLN
	 VQw1jbLNwTRSQ==
Date: Thu, 26 Mar 2026 11:04:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: David Matlack <dmatlack@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhawaja@google.com
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
Message-ID: <acT2lYJKdyXXzNPZ@kernel.org>
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
 <20260325182026.467307-2-pasha.tatashin@soleen.com>
 <2vxzikajacgc.fsf@kernel.org>
 <CALzav=eybgJwMQEtvSi2bUv8u7cic6d45r4wFZdZiKFFrrLJfQ@mail.gmail.com>
 <CA+CK2bBpa8ZnxPdsPCRCAiPeHUbqQ3TNjHTGU2eN_BGqqX2Y1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bBpa8ZnxPdsPCRCAiPeHUbqQ3TNjHTGU2eN_BGqqX2Y1Q@mail.gmail.com>

On Wed, Mar 25, 2026 at 05:08:57PM -0400, Pasha Tatashin wrote:
> On Wed, Mar 25, 2026 at 4:34 PM David Matlack <dmatlack@google.com> wrote:
> >
> > On Wed, Mar 25, 2026 at 1:20 PM Pratyush Yadav <pratyush@kernel.org> wrote:
> >
> > > For memfd and hugetlb at least, we serialize the _inode_ not the file.
> > > The inode has the contents that we care to preserve.
> > >
> > > So if two FDs point to the same inode, this will break. You can do this
> > > by first creating a memfd and then by opening "/proc/self/fd/<fd>". Then
> > > you would be able to trigger the preservation twice, causing all sorts
> > > of problems. Same on the retrieve side.
> 
> Hm.
> 
> >
> > > So unless I am missing something, I don't think this approach will work.
> > > As much as I hate to suggest it, I think we need to move this check to
> > > each caller so they can find out the object they need to serialize and
> > > check if it already is.
> >
> > I think LUO can still enforce that the file is not preserved twice.
> > HugeTLB and memfd's preserve() functions just need to also check that
> > the associated inode has not already been preserved?
> 
> For memfd/hugetlbs the true state is in inode
> For vfio/kvm the shared anonymous inode is just a dummy wrapper, and
> the true state is in file->private_data.
> 
> I wonder if we could use the XArray to track inodes for standard
> files, but track the struct file itself for anonymous files (we would
> need a new function from FS that allows us to determine if "struct
> file" has anonymous inode or not).

Don't all files we preserve use anon inodes?

How about we extend the fh->ops with a method that will return "unique"
object? 

	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
		if (fh->ops->can_preserve(fh, file)) {
			unique_handle = fh->ops->unique_handle(fh, file);
			err = 0;
			break;
		}
	}

	xa_insert(&luo_preserved_objects, unique_handle,
		  (unsigned long)unique_handle, GFP_KERNEL);
 
> Pasha

-- 
Sincerely yours,
Mike.
