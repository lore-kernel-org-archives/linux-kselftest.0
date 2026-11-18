Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036096;
	b=CrMA/GPyW0dsEi7xRmvC6HON78SxNBMCEyNx6UX3MPd0/ZEPCa/kpE/RyNVsIx7HO8Hv
	 PbNw+3ghhPti5rEb3oM1Zjhyhf+G24RjJtiH6enxEXA1Aaw8Ly3k5ge9SXNP/mxyUBrnE
	 3J5XeWww8+tHRpZ6C3a6V1kGTvZArlH7dQGs7nrg1f7znu9nwcK72BD3CRmyg2kLaMaR2
	 NkMKEmxDpLX7S61S9yRlE6kuAqQV6irHu7B6pf9bNkHOmhEQgT/LQ8XKKKnQtKU+7R7X5
	 Q/K0lNtaRprpE+SEW6+TXiKYsSWBB18pNGQjFOczY8fop9gYV6PuTpLUSP9L94UTnOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036096;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gYvo29vFQaQUxp92paawfy/fpGkwT1TbpVKZ2bg51Lk=;
	b=A0CHiigLZXIgDvgdEFMelZYFtASbHO3Z44Up+ZZq917+gajDZ5vtEUY3wv0RQIqSASEf
	 Q9QNrYyQCPDTYwWVoMNOMm/r3hqXf+mhpsoP7a+7ACobhA9kVG/4X9W5HwXa5EPV6E2WJ
	 LZTvhbQytjUH1kFvMuJ8XkTsB0NyViuJor9EZx6VHHxiYAh98o0kFwc4aDGSObISePnhc
	 XWfDCsPv4IrmI8du8SgTLP6QxTFVldScVzaLar4F6oeXfV4o9/JXFVW93RMJZYGlTd0e4
	 0nEUeZp6l/KukJ+kXfC93pBmmalGgx9uyH32xoZbnG9v3czfCeq+0alLospL8NuksbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b="W/btgby9";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FCvv1W3b;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7298606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7298606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=W/btgby9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FCvv1W3b
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B5FA4EC0635
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:08:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 18 Nov 2026 16:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795036093;
	 x=1795122493; bh=gYvo29vFQaQUxp92paawfy/fpGkwT1TbpVKZ2bg51Lk=; b=
	W/btgby98L6UpAt1uJqNDl+HyMovhExfel4TOstOpxPNdYPfqVFpFC/K5HuSoIGZ
	MaPyqDFWUgFt6t7bd4apdF2Wxs5I6c3fjb9DpK5I8eCVLIkB7BuVzHo6popu7MIp
	iaI6J3HC8FabDw/+6cQO+wJVptLS90edq8mqntv0/dP4wXWpAz/HKDzZHgStnTXW
	3O5isZ19fQnNgoVg6amaVFd+Zku75Z1lr2ErMnKgZU75elEqBlSrGJDUCJPxbPbI
	uvm3BUEiKx62dPe040eenXwdAuLX8PZqOcY2u2sSuyXpEqHjSe7A0aUxXpnWdotQ
	8diICcUcGS9x2UuUtUYklA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795036093; x=
	1795122493; bh=gYvo29vFQaQUxp92paawfy/fpGkwT1TbpVKZ2bg51Lk=; b=F
	Cvv1W3bPN7QyuybD7ANjkhGsAXGIz7LbUxHoENANFKr/Khj75zA+ctxo8zYmtoEv
	FO/8ZpmJ6YRhVDG6p4NbtJe8IcGe1ktajSF6tZX2lo3iejhZ/8OI3SOvAENr08nJ
	x//EZhf0hQ0wOxCdPHnn/ypWPjYc8OApo/gpB2IA9R9RsgJ2WGENRWNqiybgZ4gK
	XNcMGb681iL86o2f6Y3Pz4EfAzNsaG7pKUndU/Pl/cVGzDbfUm8WXp3sSwbdvxoB
	HYhkHT8yk25X9DxZi5ud/jVDLGPIAur2wgmu5+OTEmFY/s3g59eNLMjYOqZ1DuUP
	flFHcKxg8Y9rf/8mj7rAw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795036093; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ire9LTYS4bmV2NbiOyEgTOnZPeIdJahm3hsLgw6M6YLJZK7
	VMu2PFOhaoB9PbDzllLctk0+NWT8P0ooj1eA8P1MeUqeBOwek75EE8+bBZ7b101e
	cFFmwNDMrwiih4wdiEhaQCy8yt/r8AOyLhbp902LyeCvpiYIhcu9TUawsfVTmBoF
	OJdssXdY3lkNXRjJcs0M09CkoGgfpBbxWjXX2bKD176hIkvxIGw6drmBE5jgouwZ
	6klLmseaxD2Q1kEpfhzVWe0Ljvo8eTdQ6PtZ6uPkmUvrBTLNKXlf3f+RINcpZo8k
	dhwfY51fwz19vQhJ8Iv6y+cZHVd1veXCKsdjDYg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:DBw6MwT0A/9yfAR3E59js9Rlcfp5upJWmiAE6B98S8g=:Dd53dfMD02esYoTzu4UOAQnkg85CTIqhzdDNX6taZIo=;
X-ME-Sender: <xms:vBP-anTb6S_9rRWqLxkV_AXujnoeiFZ8GGRy-GhL8epqmQlP3ojprw>
    <xme:vBP-ar2pIZlyN-kHsb8k677x60J3SWhNZMKr-YksWo5Nx0GM-R03S3ebQydpP4ZXM
    fQ7sTo1MGZ5xarQFx28MN-1PZPeAH82PDxiQGE3DB-N9R9k1nlOY3k>
X-ME-Received: <xmr:vBP-anfrLi5rhP2at09t3dEP57l5mXILEp_kC9QSNeRqd2Kx0XIbXbHrs-s5bopCBsDjgBmIVKIb2tEDyjpQFqXQf8ujor7AuAFd7cXtu9gFd688rg>
X-ME-Proxy-Cause: dmFkZTEUNMEfQCdr7W+iZjs3Q2JR36Y9OZvZt6oxLs3R11vwS5ii52bbSgXHONW9FEwScO
    zLdV+Xhv12tZaUmwOfkDn0eYn8dRASgrThhO9Q8mfzbtVOONxD1cSqzt/qp2WXd6FkQAGE
    WA4TJmvRJkXzr4TfxMYp1sGxRDVCk3ilBqnmZLEyqAyi5bv4G6hoUtd7/a6BpY/sMrsUim
    M6/Zfb2Nzdy00G766lZmTVIifG+Sek+nbvTv+ABxJ6KrplqmNpTmS/LkcBQAQa9GQ0r7Zs
    Vu0UuNRgP9c1S4Mgm4BBmw/XRwKvvJFlvjH/4jiBrVoLIU8RWBL5+8bxHJ7fqDsfQWmABJ
    vqshS+J5zU4mvu+d5vK2rx4JKUd7O8iK6a3IgLx/sjIKNTBAlvRfSMeTWF5/Gdli779fgF
    cv9p1cTsW0WvI2QHXGCiL6aBR4cvR54zGLqiTyyJnEEMaxMohXlY35AIouwsLiPB3fvPS8
    hoT8ih3IaGfRGQw4GJMxYrILZ0TWSgVXZr+xUxTJooX7KBboE189M7FpMJ25UHEx1geUR/
    OkqaLC2DqB3zSsNrf5+mBrEECIbHs8ZpBJuQSM0Rus/GBHi1UfY3UOLhwZVZCPxXu44Qcq
    86UNiXMQArrlM1O6P4fzCEI64TN9VPgylS8aJWm8ci+8OriPVIXGNYJXg4DQ
X-ME-Proxy: <xmx:vBP-ajOjPe7yXmFRvbJeGDfGm_rvvCIeHipulBdO70EhwMChih-BFQ>
    <xmx:vBP-arW3ohEgpmzl9wwlWs35zAZiuEkXkUcfzaFK93enPzPnqUmrCQ>
    <xmx:vBP-arzmosYM3OgqvtFABsIZ8wBtzdssngfsc6UpDvIKiGc7D1WtMA>
    <xmx:vBP-ai_oczUAFwVZBcjNTJ_8bPGVBjpXlfCEVQ6wsRctmTsCHEEovg>
    <xmx:vRP-asA8yw3pUZnckYKGOTYgcB2I25ISIPV1J6faNqMyv7Hq1PPLdk_->
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 16:08:11 -0500 (EST)
Message-ID: <9bac7320-5e1a-4647-914e-d29d0db1dc3d@bsbernd.com>
Date: Wed, 18 Nov 2026 22:08:09 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] fuse: add FUSE_OPEN_ATOMIC
From: Bernd Schubert <bernd@bsbernd.com>
To: Jimmy Zuber <jamz@amazon.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jim Harris <jiharris@nvidia.com>,
 Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
 NeilBrown <neil@brown.name>, Joanne Koong <joannelkoong@gmail.com>
References: <20261110204421.1251726-1-jamz@amazon.com>
 <20261110204421.1251726-2-jamz@amazon.com>
 <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 18:40, Bernd Schubert wrote:
> 
> 
> On 11/10/26 21:44, Jimmy Zuber wrote:
>> Add FUSE_OPEN_ATOMIC. FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or
>> FUSE_CREATE in one request. With FUSE_OPEN_ATOMIC, the kernel opens a
>> name that is not in the dcache with one request to the server. This
>> greatly improves performance for file systems where the bottleneck is
>> calls between the kernel and the server. Servers that don't support
>> FUSE_OPEN_ATOMIC are handled gracefully.
>>
>> After a -ENOSYS reply to FUSE_OPEN_ATOMIC, every open() on the
>> connection uses FUSE_LOOKUP, FUSE_OPEN and FUSE_CREATE, including the
>> open() that received -ENOSYS.
>>
>> The kernel sends FUSE_OPEN_ATOMIC from ->atomic_open(). The VFS calls
>> ->atomic_open() for a name that is not in the dcache, and for open()
>> with O_CREAT on a negative dentry. For a name with a valid positive
>> dentry, the kernel sends FUSE_OPEN. FUSE_OPEN_ATOMIC for a name with a
>> valid positive dentry would need a VFS change.
>>
>> If the server opens an existing file, the VFS checks permissions after
>> the reply, as on other filesystems with ->atomic_open(). If open() fails
>> after a valid reply with fuse_open_out, the kernel sends FUSE_RELEASE.
>> With default_permissions, the server can receive FUSE_OPEN_ATOMIC and
>> FUSE_RELEASE for a file that the caller may not open.
>>
>> The kernel clears O_TRUNC in fuse_create_in.flags, so that the server
>> truncates a file only after the VFS checks permissions. After the VFS
>> checks permissions, the kernel sends FUSE_SETATTR to truncate an
>> existing file. A server with FUSE_ATOMIC_O_TRUNC truncates the file in
>> FUSE_OPEN. For open() with O_TRUNC on a server with FUSE_ATOMIC_O_TRUNC,
>> the kernel sends FUSE_OPEN or FUSE_CREATE after the VFS checks
>> permissions, with FUSE_LOOKUP first for a name that is not in the
>> dcache.
>>
>> The request contains fuse_create_in and the name. The reply contains
>> fuse_entry_out, and fuse_open_out if the server opened the file. The
>> server replies as follows:
>>
>> - O_CREAT | O_EXCL on an existing name: the server returns -EEXIST.
>> - An existing regular file, with or without O_CREAT: the server can
>>   open the file and return fuse_open_out. The server can also return
>>   only fuse_entry_out, and the kernel sends FUSE_OPEN after the VFS
>>   checks permissions.
>> - An existing directory, symlink or special file: the server must
>>   return only fuse_entry_out. The kernel returns -EIO for fuse_open_out
>>   on any file except a regular file.
>> - A missing name with O_CREAT: the server creates a regular file, opens
>>   it, and sets FOPEN_CREATED.
>> - A missing name without O_CREAT: the server returns a zero nodeid. The
>>   kernel caches a negative dentry, as it does for FUSE_LOOKUP.
>>
>> The server sets FOPEN_CREATED exactly when it created the file. For
>> FOPEN_CREATED, the kernel sets FMODE_CREATED, and do_open() passes an
>> acc_mode of 0 to may_open(), as for any file that open() creates.
>>
>> For O_CREAT | O_EXCL, when the caller may not create the file, for
>> example on a read-only mount, the VFS clears O_CREAT and leaves O_EXCL.
>> For O_EXCL without O_CREAT, the kernel sends FUSE_LOOKUP. For an
>> existing name, do_open() returns -EEXIST, and the server receives only
>> FUSE_LOOKUP.
>>
>> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
>> ---
>>  fs/fuse/dir.c             | 194 ++++++++++++++++++++++++++++++++++++++
>>  fs/fuse/fuse_i.h          |   6 ++
>>  fs/fuse/fuse_trace.h      |   1 +
>>  include/uapi/linux/fuse.h |  20 +++-
>>  4 files changed, 220 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
>> index 8a8177a178a20..0331d4df6248e 100644
>> --- a/fs/fuse/dir.c
>> +++ b/fs/fuse/dir.c
>> @@ -938,6 +938,185 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
>>  	return err;
>>  }
>>  
>> +/* Release the file the server opened for a reply the kernel rejects */
>> +static void fuse_open_atomic_release(struct fuse_file *ff, u64 nodeid,
>> +				     unsigned int open_size,
>> +				     unsigned int flags)
>> +{
>> +	if (open_size >= FUSE_COMPAT_OPEN_OUT_SIZE && !invalid_nodeid(nodeid)) {
>> +		ff->fh = ff->args->open_outarg.fh;
>> +		ff->nodeid = nodeid;
>> +		fuse_sync_release(NULL, ff, flags & ~(O_CREAT | O_EXCL));
>> +	} else {
>> +		fuse_file_free(ff);
>> +	}
>> +}
>> +
>> +/*
>> + * Send FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE as one FUSE_OPEN_ATOMIC
>> + * request.  The server can open an existing regular file, or return only
>> + * fuse_entry_out.  Without O_CREAT, a missing name gets a zero nodeid.
>> + * The VFS checks permissions after the reply.  Returns 1 on -ENOSYS.
>> + */
>> +static int fuse_open_atomic(const struct mnt_idmap *idmap, struct inode *dir,
>> +			    struct dentry *entry, struct file *file,
>> +			    unsigned int flags, umode_t mode)
>> +{
>> +	struct fuse_mount *fm = get_fuse_mount(dir);
>> +	struct fuse_conn *fc = fm->fc;
>> +	FUSE_ARGS(args);
>> +	struct fuse_forget_link *forget;
>> +	struct fuse_create_in inarg;
> 
> Personally I'm not so happy about struct fuse_create_in. 
> 
> https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.com/
> https://lore.kernel.org/all/20240820211735.2098951-1-bschubert@ddn.com/
> 
> 
> Summarized outcome from Miklos was that Miklos doesn't want to have another
> op code for this combined operation and that Miklos would prefer a NFS like
> compound way. Then Horst worked on compounds, with Miklos not wanting to
> have that in fuse, but only in fusex. Well, the underlying problem doesn't
> get solved - like there is a libfuse report with sshfs, where people set
> a high attr timeout and then get corruption, because the file size is plain
> wrong after open.
> 
> 
> My suggestion would be to have a new atomic_open struct, similar to
> fuse_create_in, but with flags. Given that atomic open is in the end
> just an open+getattr, we could also use that for the issue above, with the
> same new op code. However, we need Miklos' agreement here. 
> 
> We happen to have an online meeting once per month and the next is tomorrow,
> would you mind to join?
> 
> 
>> +	struct fuse_open_out *outopen;
>> +	struct fuse_entry_out outentry;
>> +	struct inode *inode = NULL;
>> +	unsigned int open_size;
>> +	u64 attr_version, evict_ctr;
>> +	struct fuse_file *ff;
>> +	struct dentry *res;
>> +	bool locked = false;
>> +	int epoch, err;
>> +
>> +	if (entry->d_name.len > fc->name_max)
>> +		return -ENAMETOOLONG;
>> +	forget = fuse_alloc_forget();
>> +	ff = fuse_file_alloc(fm, true);
>> +	if (!forget || !ff) {
>> +		kfree(forget);
>> +		if (ff)
>> +			fuse_file_free(ff);
>> +		return -ENOMEM;
>> +	}
>> +	outopen = &ff->args->open_outarg;
>> +	if (!fc->dont_mask)
>> +		mode &= ~current_umask();
>> +
>> +	/* The VFS truncates after may_open() */
>> +	memset(&inarg, 0, sizeof(inarg));
>> +	memset(&outentry, 0, sizeof(outentry));
>> +	inarg.flags = flags & ~(O_NOCTTY | O_TRUNC);
>> +	inarg.mode = mode;
>> +	inarg.umask = current_umask();
>> +	args.opcode = FUSE_OPEN_ATOMIC;
>> +	args.nodeid = get_node_id(dir);
>> +	args.in_numargs = 2;
>> +	args.in_args[0].size = sizeof(inarg);
>> +	args.in_args[0].value = &inarg;
>> +	args.in_args[1].size = entry->d_name.len + 1;
>> +	args.in_args[1].value = entry->d_name.name;
>> +	args.out_numargs = 2;
>> +	args.out_args[0].size = sizeof(outentry);
>> +	args.out_args[0].value = &outentry;
>> +	args.out_argvar = true;
>> +	args.out_args[1].size = sizeof(*outopen);
>> +	args.out_args[1].value = outopen;
>> +
>> +	if (flags & O_CREAT) {
>> +		err = get_create_ext(idmap, &args, dir, entry, mode);
>> +		if (err)
>> +			goto out_free;
>> +	} else {
>> +		/* Locked as for FUSE_LOOKUP */
>> +		idmap = &invalid_mnt_idmap;
>> +		locked = fuse_lock_inode(dir);
>> +	}
>> +	epoch = atomic_read(&fc->epoch);
>> +	attr_version = fuse_get_attr_version(fc);
>> +	evict_ctr = fuse_get_evict_ctr(fc);
>> +	err = fuse_simple_idmap_request(idmap, fm, &args);
>> +	fuse_unlock_inode(dir, locked);
>> +	free_ext_value(&args);
>> +	if (err < 0) {
>> +		if (err == -ENOSYS) {
>> +			fc->no_open_atomic = 1;
>> +			err = 1;
>> +		} else if (err == -EEXIST) {
>> +			fuse_invalidate_entry(entry);
>> +		}
>> +		goto out_free;
>> +	}
>> +
>> +	open_size = args.out_args[1].size;
>> +	if (open_size && (outopen->open_flags & FOPEN_CREATED))
>> +		fuse_dir_changed(dir);
>> +	err = -EIO;
>> +	if (outentry.nodeid && (invalid_nodeid(outentry.nodeid) ||
>> +				fuse_invalid_attr(&outentry.attr)))
>> +		goto out_reject;
>> +	/* A zero nodeid: the name does not exist and nothing was opened */
>> +	if (!outentry.nodeid && (open_size || (flags & O_CREAT)))
>> +		goto out_reject;
>> +	/* Only a regular file is opened */
>> +	if (open_size && (open_size < FUSE_COMPAT_OPEN_OUT_SIZE ||
>> +			  !S_ISREG(outentry.attr.mode)))

Why not just (open_size < sizeof(*outopen))? Why would we need to handle
a compat size for atomic open?

>> +		goto out_reject;
>> +	if (outentry.nodeid) {
>> +		inode = fuse_iget(dir->i_sb, outentry.nodeid,

Thanks,
Bernd
