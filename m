From: christian@brauner.io (Christian Brauner)
Date: Wed, 23 Jan 2019 15:27:04 +0100
Subject: [PATCH v3] selftests: add binderfs selftests
In-Reply-To: <d1893da7-1222-d303-04c7-fb0500b55088@kernel.org>
References: <20190117114854.15132-1-christian@brauner.io>
 <20190123105457.k7oobylgq6rwka55@brauner.io>
 <20190123110052.GB22520@kroah.com>
 <d1893da7-1222-d303-04c7-fb0500b55088@kernel.org>
Message-ID: <20190123142703.ta7j3jnyaqc7ahgn@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190123142704.k7AINV6TN7A52MkTZvzU9JtnbHKIMVhLYKvTUykvkwY@z>

On Wed, Jan 23, 2019@07:15:01AM -0700, shuah wrote:
> On 1/23/19 4:00 AM, Greg KH wrote:
> > On Wed, Jan 23, 2019@11:54:58AM +0100, Christian Brauner wrote:
> > > On Thu, Jan 17, 2019@12:48:54PM +0100, Christian Brauner wrote:
> > > > This adds the promised selftest for binderfs. It will verify the following
> > > > things:
> > > > - binderfs mounting works
> > > > - binder device allocation works
> > > > - performing a binder ioctl() request through a binderfs device works
> > > > - binder device removal works
> > > > - binder-control removal fails
> > > > - binderfs unmounting works
> > > > 
> > > > The tests are performed both privileged and unprivileged. The latter
> > > > verifies that binderfs behaves correctly in user namespaces.
> > > > 
> > > > Cc: Todd Kjos <tkjos at google.com>
> > > > Signed-off-by: Christian Brauner <christian.brauner at ubuntu.com>
> > > 
> > > Hey Shuah,
> > > 
> > > If you're ok with the patch in its current form, can you please make
> > > sure that this still lands in 5.0? If at all possible I'd like to have
> > > all ducks in a row and release binderfs with selftests and everything.
> > > :)
> > 
> 
> The patch is good and I was planning to get this into 5.1.
> 
> > I can take it in my tree with the other binderfs patches if I can get an
> > ack from Shuah.
> > 
> 
> Great. It is good for the test patch to go with the other binderfs
> patches.
> 
> Acked-by: Shuah Khan <shuah at kernel.org>

Thanks for the quick response!
Christian
