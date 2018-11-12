From: adobriyan@gmail.com (Alexey Dobriyan)
Date: Mon, 12 Nov 2018 17:14:57 +0300
Subject: [PATCH] proc: fixup map_files test on arm
In-Reply-To: <1541904527.857883.1572718104.2AE8D0DA@webmail.messagingengine.com>
References: <20181110184920.GA18252@avx2>
 <1541904527.857883.1572718104.2AE8D0DA@webmail.messagingengine.com>
Message-ID: <20181112141456.GA15690@avx2>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181112141457.9idzsJEu491NYLijGhKx8vGlVrrm58_Q5frV8be8q4o@z>

On Sun, Nov 11, 2018@12:48:47AM -0200, Rafael David Tinoco wrote:
> Including Shuah and kselftest list...
> 
> On Sat, Nov 10, 2018,@4:49 PM, Alexey Dobriyan wrote:
> > https://bugs.linaro.org/show_bug.cgi?id=3782
> > 
> > Turns out arm doesn't allow to map address 0, so try minimum virtual
> > address instead.
> > 
> > Reported-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> > Signed-off-by: Alexey Dobriyan <adobriyan at gmail.com>
> > ---
> > 
> >  tools/testing/selftests/proc/proc-self-map-files-002.c |    9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > --- a/tools/testing/selftests/proc/proc-self-map-files-002.c
> > +++ b/tools/testing/selftests/proc/proc-self-map-files-002.c
> > @@ -13,7 +13,7 @@
> >   * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT 
> > OF
> >   * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> >   */
> > -/* Test readlink /proc/self/map_files/... with address 0. */
> > +/* Test readlink /proc/self/map_files/... with minimum address. */
> >  #include <errno.h>
> >  #include <sys/types.h>
> >  #include <sys/stat.h>
> > @@ -47,6 +47,11 @@ static void fail(const char *fmt, unsigned long a, 
> > unsigned long b)
> >  int main(void)
> >  {
> >  	const unsigned int PAGE_SIZE = sysconf(_SC_PAGESIZE);
> > +#ifdef __arm__
> > +	unsigned long va = 2 * PAGE_SIZE;
> > +#else
> > +	unsigned long va = 0;
> > +#endif
> >  	void *p;
> >  	int fd;
> >  	unsigned long a, b;
> > @@ -55,7 +60,7 @@ int main(void)
> >  	if (fd == -1)
> >  		return 1;
> >  
> > -	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
> > +	p = mmap(va, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
> >  	if (p == MAP_FAILED) {
> >  		if (errno == EPERM)
> >  			return 2;
> 
> I have sent a patch removing proc-self-map-files-002 AND making 001 to use as a
> HINT for mmap (MAP_FIXED) *at least*  *(2 * PAGE_SIZE), which would, likely,
> attend all  architectures, avoiding trying to make the test specific to one,
> and, still, test the symlinks for issues (like bad chars, spaces, so on).

If the goal is to test the lowest address then going for 2*PAGE_SIZE is
a mistake.

Which BTW hints to add a test for the highest address.

> Both tests (001 and 002) have pretty much the same code, while they could have 2
> tests in a single code, using kselftest framework. Is NULL hint + MAP_FIXED
> something imperative for this test ? Why not to have all in a single test ?

I dislike tests which lump everything together into one process.

> Are you keeping the NULL hint just to test mmap, apart" from the core of
> this test ?
