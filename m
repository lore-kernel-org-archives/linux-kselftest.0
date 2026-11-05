Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893366;
	b=QH/lFHCCOvIQnRgoijn2N62i7aFZsFYKCo8eMQH6kSkIs5bn49K1Q7DTzoH2OAKuc8u9
	 LoZCRdgYl7N78vwrWvv8ZjKKG85FDOCs4P+MXFHF/Scz/h2eJyoaE4uU1nPJuaXPtw8F8
	 NNCYPaTyUdriP77AE2cNTIG2iYE9pcCQ5q/cBlmfx2B5NJm0WlgsdQu9AFjWZ2jO7jB40
	 UTH/9t5jhK6cJ6phtsZjqiJZ+HDRpAhzyCk45JZm+4zei54HQtGP+o/Z7iKJ4TsDXnLM3
	 YdH6YPJPppqap9SE1kHoYuDb5UtTMNadpXNJjPpNiD3shABt45wNYqqMG+3xp60AulA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CTsd4K4FS1c/0QtVRFQ6L4sBWzBDsskkKVi3HBwNbgQ=;
	b=ylfTFY1fYcWVbFMUftUYIPVRdPDO6CZdiw6xIEg9ipjjRJt+Hb1NPdHYYmIgf0IKVMyP
	 1gMuAtPV7EeYCWVWaIVNu165iVhB2mfV4nX885Lybh5NPpz72eThkgd95CciP+eRj+lr8
	 dl9Z4QvrClJ+rq4qXdOeUkAyR7dpWKsEV+BMdSSU6tlBirUNxnJQcN6uf7vtJhM/kByCG
	 08MhTGJjQno9YZ4OiFFEI6pspkLoMSkKruCJlE6eT++D9BQxAIkPhV2FKTqj0iCegmn0f
	 qpN+cx3Y/8L0fmHgeS4WlTBTFNZD9YRbNSZ+IfEjnslrxt9FXLhrtK21I7URrKcTj9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7FoqcmY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB2606A32C;
	Thu,  5 Nov 2026 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7FoqcmY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5BF1F000C1;
	Thu,  5 Nov 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893365;
	bh=CTsd4K4FS1c/0QtVRFQ6L4sBWzBDsskkKVi3HBwNbgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7FoqcmYX/+njg5zd1k1bA+FOA+lDCfiQNMdQHITGrpFOtDmfodmQeUvlG8+8QdRY
	 dDOSBg47/nnwS77SH1jriKunFI3Cf1YOogrSEPvaokKcDhCBbxJ51evpByksS3uR8Q
	 jAz59rW48V/DSQ7VFwoWcUKs7VhS9lxCpN33OC0L6hW91Z0COzvnr2cl5dHN5C18SK
	 xqs5IN75QQH3MMCyO2H21i49gUXYNT2NULY4YudARb8bmgEuX3EWn+M7+wEvTRWNWI
	 OV/7ivC6SN+MnTQoWZ2WI8WgIXhh1udieUA8CDzRCP1Og1YArIngLLm/7fkA5e7d31
	 SW+g94h6ECq8Q==
Date: Thu, 5 Nov 2026 16:42:38 +0100
From: Christian Brauner <brauner@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 00/10] liveupdate: Preserve tmpfs files across Live
 Update
Message-ID: <20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner>
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>

On Tue, Nov 03, 2026 at 01:02:06AM +0000, David Matlack wrote:
> The kernel preserves the contents, size, file position and seals of each
> file. After the Live Update, userspace retrieves each file onto a tmpfs
> mount of its choice and links it at the path of its choice, so userspace
> decides the directory structure, names, owners and permissions of the
> restored files.

[...]

>   4. Retrieve files that were preserved from a tmpfs mount onto a tmpfs
>      mount chosen by userspace, via the new struct
>      liveupdate_shmem_retrieve_arg. The kernel creates the file as if by
>      openat(dirfd, ".", O_TMPFILE | flags, mode), so the file gets the
>      same flags, owner, permission checks and security labels as any
>      other new file in that directory, and is charged to that mount.
>      The kernel fills the file before returning it, so nothing else can
>      access the file before it is complete, and userspace links it at
>      the path it wants with linkat() (patch 7).

No, sorry. That's not what we discussed at LPC and it's not what the RFC
and v1 did.

There userspace created the file and LUO filled in the contents. That
got turned around in the v1 thread and I think that was a big mistake.

The kernel is now responsible for creating the file and for its
permissions but it preserves none of that? No owner, no mode, no
xattrs, no security labels, nothing.

Instead userspace passes a struct that duplicates the open() argument
list and the kernel runs umask, setgid inheritance, default ACLs and LSM
labeling on it. That makes no sense whatsoever. Either the kernel owns
the metadata as well or it stays out of it completely.

Spoiler, it should stay out of it.

Userspace is responsible for everything but the contents. Take systemd
wanting to preserve a whole tmpfs. We already know how that works and
discussed that at LPC with you.

- We generate a manifest of the filesystem ith every file with its owner,
  mode and xattrs using UAPI.17 manifests (cf. [1]).

  We stash it in a memfd and reassemble the tree in userspace after the
  live update. All it needs from the kernel are the contents. Having the
  kernel recreate any of that is pointlessly complex.

So instead of LUO handing out a file descriptor for a file it invented,
let userspace create the file, O_TMPFILE, O_CREAT, whatever it likes,
with the owner, mode and xattrs it wants, and let LUO put the contents
into it. That's what the RFC did.

The checks on the target are trivial: a writable fd to an empty shmem
file with the inode lock held while you fill it. A tmpfs file can't be
sealed, it only ever has F_SEAL_SEAL, so there's nothing to restore but
contents and size anyway.

Pasha, your argument for creating the file in the kernel was that
nobody can reach it while it's being filled. **That's what O_TMPFILE is
for**: Userspace creates it unlinked, LUO fills it, userspace links it.
If userspace hands a half-filled file to iommufd that's its own problem.

I also really dislike file_open_root() for this. It's an openat()
emulation inside an ioctl which is completely terrible.

It redoes the openat2() validation by hand (reject O_PATH, unknown
flags, stray mode bits), force O_LARGEFILE, and because O_TMPFILE
insists on write access you open the file O_RDWR, copy the normalized
f_flags out of the first struct file, dentry_open() the same path a
second time read-only without any permission check and drop the first
file again.

So an LSM sees an O_RDWR open for what userspace asked to be O_RDONLY.
Whatever path_openat() happens to do for that synthesized flag
combination becomes LUO's behavior. That's brittle as fsck. All of it
goes away when userspace is responsible for that.

Fwiw, the permission model you end up with on retrieve is write and
search permission on the target directory, i.e. vfs_tmpfile()'s
inode_permission(dir, MAY_WRITE | MAY_EXEC) plus mnt_want_write() on
that mount. The new inode is owned by whoever runs the ioctl with
whatever mode they asked for. Nothing about the original file matters.
IOW, the kernel has nothing to contribute here that open() doesn't
already do.

Really, please make the kernel's job stupidly simple: let userspace get
the contents and let it be responsible for the actual complex restore
and the filesystem layout.

A hybrid helps absolutely no one.

>   - Is patch 9 (retrieving tmpfs files with O_RDONLY) worth merging?

No. With userspace creating the file this doesn't exist.

>     are created with mode 0777 (or 0666). Is this the right permission
>     model for preserving files? Should this apply all files or just
>     shmem files?

The preserve side seems fine to me. If you freeze the size of a file
for everyone you better be allowed to write to it.

[1]: https://uapi-group.org/specifications/specs/file_manifest/
