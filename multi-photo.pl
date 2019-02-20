use warnings;
use strict;

use Image::Thumbnail;
use FindBin;

# take photos
# add more numbers to array to take more photos
my @photos_to_take = (1,2,3);
foreach (@photos_to_take) {
	take_photo($_);
}

sleep 2; # give program time to finish taking photos
resize_images();


######################### subs ##############################################

# Usage     : take_photo($number);
# Purpose   : take a photo and name it with argument number
# Arguments : the number of the photo taken
sub take_photo {
	my ($number) = @_;

	my $file = "$FindBin::Bin/take-photo-" . $number . ".bat";
	my $cmd = 'start "" "' . $file . '"';
	system($cmd);
}

# Usage     : resize_images();
# Purpose   : resize all images in the root folder
sub resize_images {
    # grab images from folder
    opendir( DIR, "./" );
    my @files = grep( /\.(jpg|JPG|png|PNG)$/, readdir(DIR) );
    closedir(DIR);

    # resize each image
    foreach my $file (@files) {
        my $id = $file;
        $id =~ s(\.(jpg|JPG|png|PNG)$)();

        # write the file to a temporary location
        my $location  = $id . '.JPG';

        # Resize image and write it to the appropriate location
        my $t = new Image::Thumbnail(
            module     => 'Image::Magick',
            quality    => 95,         # amount of compression, 100 none, 1 tons
            size       => 1980,       # maximum dimension
            create     => 1,
            density    => "72x72",    # resolution of photo
            inputpath  => $location,
            outputpath => $location
        );
    }

	return
}
