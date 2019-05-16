From: cyphar at cyphar.com (Aleksa Sarai)
Date: Fri, 17 May 2019 00:56:07 +1000
Subject: [PATCH v1 1/2] pid: add pidfd_open()
In-Reply-To: <20190516142659.GB22564@redhat.com>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516142659.GB22564@redhat.com>
Message-ID: <20190516145607.j43xyj26k6l5vmbd@yavin>

On 2019-05-16, Oleg Nesterov <oleg at redhat.com> wrote:
> On 05/16, Christian Brauner wrote:
> >
> > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > created pidfds at process creation time.
> 
> Now I am wondering why do we need CLONE_PIDFD, you can just do
> 
> 	pid = fork();
> 	pidfd_open(pid);

While the race window would be exceptionally short, there is the
possibility that the child will die and their pid will be recycled
before you do pidfd_open(). CLONE_PIDFD removes the race completely.

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190517/3962dbf0/attachment.sig>
